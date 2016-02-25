aburl = 'http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data'
abnames = c('sex','length','diameter','height','weight.w','weight.s','weight.v','weight.sh','rings')
abalone = read.table(aburl, header = F , sep = ',', col.names = abnames)
rmat=as.matrix(cor(na.omit(abalone[,-1])))
rinv=solve(rmat)
pcmat=cov2cor(rinv)
pcmat=-pcmat
diag(pcmat)=1
