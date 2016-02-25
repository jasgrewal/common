# wrapper function for factanal, truncated vine with gausstrvine.
# gausstrvine() and gausstrvine.mst() are functions in CopulaModel;
# gausstrvine.mst() requires library(igraph)
# CopulaModel is an R package available from copula.stat.ubc.ca

# Run the code in the wrapper functions line-by-line to understand
# what is happening.

# output Dfit and max/average absolute correlation matrix difference 
# if d>8, use only greedy MST for truncated vine

# rmat = correlation matrix
# discrepancy of fit summaries for factor and truncated vine structures
# nsize = sample size
# mxfact = max number of factors
# mxtrunc = max truncation level for vine
# ienum = T to enumerate through the truncated partial correlation vines 
# Output:
#   nothing is returned.
#   There is print out of diagnostics to compare factor structures
#    and "best" truncated vine structures.
dfitcomp=function(rmat,nsize,mxfact,mxtrunc,ienum=F)
{ d=nrow(rmat)
pca=eigen(rmat)
#cat("\neigenvalues\n")
#print(pca$val)
evalrt=sqrt(pca$values)
evec=pca$vectors
loadmat=t(evec)*evalrt
loadmat=t(loadmat)  # eigenvector *sqrt(its eigenvalue)
npar=0
for(nf in 1:mxfact)
{ #fa=factanal(covmat=rmat,factors=nf)
  # replace above with try, factanal can sometimes fail if default start
  #  is not good
  fa=try(factanal(covmat=rmat,factors=nf), silent=T)
  if(class(fa)!="factanal") 
  { fa=try(factanal(covmat=rmat,start=loadmat[,1:nf],factors=nf), silent=T) }
  if(class(fa)!="factanal") 
  { fa=try(factanal(covmat=rmat,start=matrix(.5,d,nf),factors=nf), silent=T) }
  if(class(fa)=="factanal") 
  { npar=npar+d+1-nf
  tem=as.matrix(fa$loading[,1:nf])
  rfact=tem%*%t(tem)+diag(fa$uniq)
  cat("\n#factors=", nf,"\n")
  cat("max abs difference =", max(abs(rmat-rfact)),"\n")
  cat("ave abs difference =", sum(abs(rmat-rfact))/d/(d-1),"\n")
  cat("corDis,2*nllk,AIC,BIC=", corDis(rfact,rmat,nsize,npar=npar),"\n")
  cat("loading matrix\n")
  print(fa$loading[,1:nf])
  }
  else { cat("factanal failed\n") }
}

# truncated vine with greedy MST
cat("============================================================\n")
bestmst=gausstrvine.mst(rmat,ntrunc=mxtrunc,iprint=F)
perm=diag(bestmst$RVM$VineA)
Aori=bestmst$RVM$VineA
iperm=order(perm)
AA=varrayperm(Aori,iperm)
pcmat=bestmst$RVM$pc
rperm=rmat[perm,perm]
cat("A, pcor:\n")
print(Aori)
print(pcmat)
npar=0
for(ell in 1:mxtrunc)
{ Rtrun=pcor2cor.truncvine(pcmat,AA,ntrunc=ell)
npar=npar+(d-ell)
if(ell>1) Rtrun=Rtrun$rmat
cat("\nMST",ell,"-truncated R-vine with npar=", npar,"\n")
cat("max abs difference =", max(abs(rperm-Rtrun)),"\n")
cat("ave abs difference =", sum(abs(rperm-Rtrun))/d/(d-1),"\n")
outtr=corDis(Rtrun,rperm,nsize,npar=npar)
cat("corDis:Dfit, 2*nllk, AIC, BIC=", outtr,"\n")
}
# enumeration for d<=8 and ienum=T
if(d>8) ienum=F
if(ienum)
{ bestvines=gausstrvine(rmat,iprint=F)
cat("============================================================\n")
cat("enumeration of truncated vines\n")
ub=d-2
npartr=0
for(ell in 1:ub)
{ Aa=vnum2array(d,bestvines$bnum[ell])
perma=bestvines$permmat[,ell]
rperm=rmat[perma,perma]
pcmata=matrix(0,d,d)
pcmata[1:ell,]=bestvines$pcarr[1:ell,,ell]
Rmod=pcor2cor.truncvine(pcmata,Aa,ntrunc=ell)
if(ell>=2) Rmod=Rmod$rmat
npartr=npartr+(d-ell)
dfit=corDis(Rmod,rperm,n=nsize,npar=npartr)
cat("\nenumeration trunc level=", ell,"\n")
cat("max abs difference =", max(abs(rperm-Rmod)),"\n")
cat("ave abs difference =", sum(abs(rperm-Rmod))/d/(d-1),"\n")
cat("corDIS:Dfit\n")
print(dfit)
cat("A, perm, pcor:\n")
Aperm=varrayperm(Aa,perma)
print(Aperm)
cat(perma,"\n")
print(pcmata[1:ell,])
}
}
invisible(0)
}
