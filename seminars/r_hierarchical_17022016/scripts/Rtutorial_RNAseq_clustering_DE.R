#######################
#load data
#######################

#load CESC mRNA-Seq data
data=read.table("/Users/jgrewal/mygits/gene_scripts/r_hierarchical_17022016/data/gdac.broadinstitute.org_CESC.Merge_rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__RSEM_genes_normalized__data.Level_3.2015110100.0.0/CESC.rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__RSEM_genes_normalized__data.data.txt", row.names=1, header=T, check.names=F, sep="\t") #check.names=F makes it so R leaves the names as is
head(data)
# TCGA-2W-A8YY-01A-11R-A37O-07 TCGA-4J-AA1J-01A-21R-A38B-07 TCGA-BI-A0VR-01A-11R-A10U-07
# ?|100130426                       0.0000                       0.0000                       0.0000
# ?|100133144                       8.6373                       7.6079                      24.0220
# ?|100134869                      27.4857                      29.1286                      31.7792
# ?|10357                         118.5443                     180.7091                     165.6901
# ?|10431                        1072.9614                    1014.9509                     954.1212
# ?|136542                          0.0000                       0.0000                       0.0000

#load covariates
covariates=read.table("/Users/jgrewal/mygits/gene_scripts/r_hierarchical_17022016/data/CESC_covariates.formatted.subset.txt", row.names=1, header=T, sep="\t")
head(covariates)
# Histology    HPV_status
# TCGA-FU-A3EO-01A-11R-A213-07 Adenocarcinoma indeterminate
# TCGA-EA-A4BA-01A-21R-A26T-07 Adenocarcinoma      negative
# TCGA-EA-A556-01A-11R-A26T-07 Adenocarcinoma      negative
# TCGA-FU-A57G-01A-11R-A26T-07 Adenocarcinoma      negative
# TCGA-IR-A3LA-01A-11R-A22U-07 Adenocarcinoma      negative
# TCGA-VS-A8QH-01A-11R-A37O-07 Adenocarcinoma      negative

#subset data by just the samples in the covariates file
mat=data[,row.names(covariates)]

#######################
#Hierarchical clustering
#######################

#subset data with the top most variable genes
meanthresh=100
mat0=subset(mat,apply(mat,1,mean)>meanthresh)
cv=apply(mat0,1,sd)/apply(mat0,1,mean) #coefficient of variation
mat0=subset(mat0,cv>quantile(cv,probs=.75)) #top 25% most variable with mean > meanthresh

#log-transform
mat1=log2(mat0+1) #Add 1 to treat the 0 values properly with log transform
#median center
mat2=sweep(mat1, 1, apply(mat1,1,median,na.rm=T), "-") 

#set heatmap colours 
colfunc<-colorRampPalette(c("RoyalBlue","black","yellow"))(9)
colfunc=colfunc[c(1:3,5,7:9)]
breaks2=c(min(mat2),-2,-1,-0.5,0.5,1,2,max(mat2))

#set pheatmap clustering parameters
clust_dist_col="correlation" #‘"correlation"’ for Pearson correlation, ‘"euclidean"’, ‘"maximum"’, ‘"manhattan"’, ‘"canberra"’, ‘"binary"’ or ‘"minkowski"’
clust_method="ward.D2" #‘"ward.D"’, ‘"ward.D2"’,‘"single"’, ‘"complete"’, ‘"average"’ (= UPGMA), ‘"mcquitty"’ (= WPGMA), ‘"median"’ (= WPGMC) or ‘"centroid"’ (= UPGMC)
clust_scale="none" #"column", "none", "row"

#cluster using pheatmap
library(pheatmap)

h<-pheatmap(mat2, breaks=breaks2, col=colfunc, cluster_rows = TRUE, cluster_cols = T, scale=clust_scale, show_rownames = F, show_colnames = F, annotation=covariates, annotation_legend=T , clustering_method=clust_method, clustering_distance_cols = clust_dist_col, border=NA)
#, filename=paste0(output,"/heatmap_",nrow(track),"rows_covariates.pdf"), width =  8, height = 7)
#Note: pheatmap will return an error if there are any rows of all zero

#alternatesly you can row-scale instead of median centering
#breaks1=c(min(t(scale(t(mat1)))),-2,-1,-0.5,0.5,1,2,max(t(scale(t(mat1)))))
#h<-pheatmap(mat1, breaks=breaks1, col=colfunc, cluster_rows = TRUE, cluster_cols = T, scale="row", show_rownames = F, show_colnames = F, annotation=covariates, annotation_legend=T , clustering_method=clust_method, clustering_distance_cols = clust_dist_col, border=NA)

#look at your solution in the context of the distance matrix heatmap
cormat=cor(mat0,method="pearson")
col_order=h$tree_col[["labels"]][h$tree_col[["order"]]] #get sample ordering
pheatmap(cormat[col_order,col_order],show_rownames = F, show_colnames = F, annotation=covariates, cluster_cols = F, cluster_rows = F)

##Change the color of the covariates
var1=c("blue","gray","black")
names(var1)=levels(covariates$HPV_status)
var2=c("purple","lightblue")
names(var2)=levels(covariates$Histology)
covar_color=list(HPV_status=var1, Histology=var2)
pheatmap(cormat[col_order,col_order],show_rownames = F, show_colnames = F, annotation=covariates, annotation_colors=covar_color, cluster_cols = F, cluster_rows = F)

#get the clustering solutions for different K using the cutree function
membership=matrix(0,ncol(mat1),9)
colnames(membership)=paste0("cluster_k",2:10)
row.names(membership)=col_order
for (k in 2:10) {
  membership[,k-1]=as.numeric(cutree(h$tree_col, k)[col_order])
}

#######################
#Consensus Cluster Plus
#https://www.bioconductor.org/packages/3.3/bioc/vignettes/ConsensusClusterPlus/inst/doc/ConsensusClusterPlus.pdf
#######################
library("ConsensusClusterPlus")

title="CCPtest" #The results will be put in this directory

results = ConsensusClusterPlus(as.matrix(mat2) ,maxK=6, reps=50, pItem=0.8, pFeature=0.8, title=title, clusterAlg="hc", distance="pearson", plot="png") #pItem-the fraction of rows (genes) to use for each rep. #pFreature-the fraction of columns (samples) to used in each rep
#clusterAlg: "hc", "pam", "km", "kmdist"
#Note: For a real run use reps=1000, raise maxk
##Try: run consensusClusterPlus with pItem/pFeature = .25, .5, .75. How do the solutions compare? 
##Try: run CCP using the 4 different clusterAlg functions and compare the solutions.

#write out cluster membership file (for reference)
#for (k in 2:6) {
#membership=as.matrix(results[[k]]$consensusClass[results[[k]]$consensusTree[["order"]]])
#colnames(membership)="cluster"
#write.table(membership,paste0(title,"/CCP_membership_",k,".txt"),quote=F,sep="\t")

#After executing ConsensusClusterPlus, one can optionally calculate cluster-consensus and item-consensus results by
#icl = calcICL(results,title=title,plot="pdf")
#write.table(icl[["itemConsensus"]][,c(3,1,2,4)], paste0(title,"/calcICL_itemConsensus.txt"), quote=F, row.names=F)


##### look at the tracking plot and the membership heatmaps

#look at the heatmap in CCP cluster order
k=3 #number of clusters 
membership=as.matrix(results[[k]]$consensusClass[results[[k]]$consensusTree[["order"]]])
colnames(membership)="Cluster"
covarmem=cbind(membership,covariates[row.names(membership),]) 
covarmem[,1]=as.factor(covarmem[,1]) #need to factor the membership numbers otherwise R thinks the covariate should be numeric

pheatmap(mat2[,row.names(membership)], breaks=breaks2, col=colfunc, cluster_rows = T, cluster_cols = F, scale="none", show_rownames = F, show_colnames = F, annotation=covarmem, clustering_method="ward.D2")


##############################
# SAM - Differential Expression analysis
#http://statweb.stanford.edu/~tibs/SAM/sam.pdf
############################
#source("https://bioconductor.org/biocLite.R")
source("http://bioconductor.org/biocLite.R") #at work...may need without the s-secure
biocLite("impute")
#then install samr
library("samr")

indAdeno=which(covariates$Histology=="Adenocarcinoma")
indSquam=which(covariates$Histology=="Squamous")

EXPR <- data[,c(row.names(covariates)[indAdeno],row.names(covariates)[indSquam])]
EXPRsub <- subset(EXPR,apply(EXPR,1,mean)>100)
y=c(rep(1,length(indAdeno)),rep(2,length(indSquam))) #group 1, group 2 labels
#y=sample(y) #Try randomizing the two groups and rerun
num_samples=ncol(EXPRsub)

system.time(samfit <- SAM(EXPRsub, y, genenames=row.names(EXPR), resp.type="Two class unpaired", nperms=10, fdr.output=0.05, testStatistic="wilcoxon")) #nperms should be at least 1000. 

#look at the DE genes
#names(samfit)
# [1] "samr.obj"       "del"            "delta.table"    "siggenes.table"
# [5] "call"  
#names(samfit$siggenes.table)
# [1] "genes.up"            "genes.lo"            "color.ind.for.multi"
# [4] "ngenes.up"           "ngenes.lo"
head(samfit$siggenes.table$genes.up)
plot(samfit)
