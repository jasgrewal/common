# Functions for input of data set or correlation matrix to get
# a Bayesian network dependence structure and its correlation matrix.

# The R library library(bnlearn) is needed for function bn.fit()
# for function corDis(), either source("cormat.R") or library(CopulaModel)
# CopulaModel is an R package available from copula.stat.ubc.ca

# regression coeff to correlation matrix for Bayesian network
#  assuming variables have been standardized to have a mean of 0 and SD of 1
# this is like reg2cor with A=C-vine array
reg2cor.bn=function(phm,iprint=F) 
{ d=nrow(phm)
rr=matrix(0,d,d)
diag(rr)=1
# correlation matrix implied by the Bayesian network
for(j in 2:d) 
{ for (k in 1:(j - 1)) 
{ tem=0
for (ell in 1:(j - 1)) tem = tem + rr[ell,k]*phm[j,ell]
rr[k,j]=tem
rr[j,k]=tem
}
}
if(iprint) print(rr)
# residual variance 
psi2=rep(1,d)
for (j in 2:d) 
{ j1=j-1
tem=0
for (ell in 1:j1) 
{ for (k in 1:j1) 
{ tem = tem + phm[j,ell]*phm[j,k]*rr[ell,k] }
}
psi2[j]=1-tem
}
if(any(psi2<0)) cat("*** regressions incorrect, negative variances\n")
list(rmat=rr,psi2=psi2)
}

# additional functions for extracting the matrix of regression coefficients

# get permutation of the variables
bnperm=function(ph,iprint=F)
{ 
  d=nrow(ph)
  #iph=as.numeric(ph>0)
  iph=as.numeric(abs(ph)>0)
  iph=matrix(iph,d,d)
  kcol=rep(0,d)
  for(i in 1:d)
  { tem=apply(iph,1,sum)
  ii=which(tem==0)
  j=ii[1]   # first case where row sum is 0
  kcol[i]=j
  iph[,j]=0; iph[j,j]=1  # row j will not be considered further
  if(iprint) print(j)
  }
  kcol
}

# extract matrix of regression coefficients
# bnobj is bn object with d nodes
bnextr=function(d,bnobj)
{ phmat=matrix(0,d,d)
for( i in 1:d)
{ tem=bnobj[[i]]$parents
coe=bnobj[[i]]$coef
kpar=length(tem)
if(kpar==0) next
#print(tem)
#print(coe)
for(k in 1:kpar)
{ j=strtoi(substr(tem[k],2,3)) 
# above assumes tem[1] has single letter and #vars<100
#print(j)
phmat[i,j]=coe[tem[k]]
}
}
phmat
}

# test example
#ph=matrix(0,7,7)
#ph[1,]=c(0,0,0,0,0,0,1)
#ph[2,]=c(1,0,1,0,0,0,0)
#ph[3,]=c(1,0,0,0,1,0,1)
#ph[4,]=c(1,1,0,0,0,0,0)
#ph[6,]=c(1,0,0,0,1,0,0)
#ph[7,]=c(0,0,0,0,1,0,0)
#bnperm(ph,iprint=T)
#  5 7 1 3 2 4 6  OK


# wrapper function for discrepancy of fit summary given correlation matrix
# if no data set is inputted,
#   need to generate multivariate normal data with this given matrix.
dfitbn.cor=function(rmat,nn,seed=123,iprint=F)
{ d=nrow(rmat)
# generate zdat with given correlation matrix rmat (idea due to Bo Chang)
set.seed(seed)
rchol=chol(rmat)
xdat=matrix(rnorm(nn*d),nn,d)
xdat=xdat%*%rchol
xdat=scale(xdat)
rmatemp=cor(xdat)
rcholemp=chol(rmatemp)
rinvemp=solve(rcholemp)
tem=xdat%*%rinvemp
zdat=tem%*%rchol
if(iprint) print(cor(zdat))
zdat=as.data.frame(zdat)
# use hill climbing algorithm (it may have some tuning parameters)
# alternative algorithms can be used at this point (see bnlearn documentation)
ostd = hc(zdat)
fitbn = bn.fit(ostd, zdat)
if(iprint) print(fitbn)
phmat=bnextr(d,fitbn)
if(iprint) print(phmat)
# npar = number of non-zeros in phmat
npar=sum(abs(phmat)>0)
perm=bnperm(phmat)
ph2=phmat[perm,perm]
robj=reg2cor.bn(ph2,iprint=F)
Rmod=robj$rmat
iorder=order(perm)
Rmod=Rmod[iorder,iorder]
#Robs=rmat[perm,perm]
Robs=rmat
dfit.bn=corDis(Rmod,Robs,n=nn,npar=npar)
mxcordif=max(abs(Robs-Rmod))
avcordif=sum(abs(Robs-Rmod))/d/(d-1)
cat("max abs difference =", mxcordif,"\n")
cat("ave abs difference =", avcordif,"\n")
cat("corDis,2*nllk,AIC,BIC=\n")
print(dfit.bn)
list(bn=fitbn,phimat=phmat,Rmodel=Rmod,mxcordif=mxcordif,avcordif=avcordif,
     dfit=dfit.bn)
}

# wrapper function for discrepancy of fit summary given data set
# dat is nxd data matrix
dfitbn.data=function(dat,iprint=F)
{ d=ncol(dat)
nn=nrow(dat)
# standardized all variables
zdat=scale(dat)
zdat=as.data.frame(zdat)
# use hill climbing algorithm (it may have some tuning parameters)
# alternative algorithms can be used at this point (see bnlearn documentation)
ostd = hc(zdat)
fitbn = bn.fit(ostd, zdat)
if(iprint) print(fitbn)
phmat=bnextr(d,fitbn)
if(iprint) print(phmat)
# npar = number of non-zeros in phmat
npar=sum(abs(phmat)>0)
perm=bnperm(phmat)
ph2=phmat[perm,perm]
robj=reg2cor.bn(ph2,iprint=F)
Rmod=robj$rmat
iorder=order(perm)
Rmod=Rmod[iorder,iorder]
#Robs=rmat[perm,perm]
Robs=rmat
dfit.bn=corDis(Rmod,Robs,n=nn,npar=npar)
mxcordif=max(abs(Robs-Rmod))
avcordif=sum(abs(Robs-Rmod))/d/(d-1)
cat("max abs difference =", mxcordif,"\n")
cat("ave abs difference =", avcordif,"\n")
cat("corDis,2*nllk,AIC,BIC=\n")
print(dfit.bn)
list(bn=fitbn,phimat=phmat,Rmodel=Rmod,mxcordif=mxcordif,avcordif=avcordif,
     dfit=dfit.bn)
}
