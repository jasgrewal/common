library(knitr)
knitr::opts_chunk$set(echo=TRUE, warning=FALSE, message=FALSE, tidy.opts=list(width.cutoff=80),tidy=TRUE)
height_basic=6

# If you don't have a package installed already  
# install.packages("packagename")
# Otherwise, load it into the environment
library(ggplot2)
library(ggpubr)
library(reshape2)

## Load the data  
data_df <- read.table("data_sp_scaled.txt", sep="\t", stringsAsFactors=F, header=T)
## and the covariate information
metadata_df <- read.table("metadata.txt", sep="\t", stringsAsFactors=F, header=T)

table(complete.cases(data_df))

table(complete.cases(t(data_df)))

## ---------------- ##
# Over 50% of the genes across 5 samples are missing. We can deal with this by discarding the problematic samples, using the complete.cases() function!  

data_df_clean <- data_df[complete.cases(data_df), ]

# We can then do a quick smell-test on the data using the dataframe function summary(). This function summarizes each column of the dataframe. We can summarize each sample (currently each row) by transposing the dataframe.  
summary(t(data_df_clean))

## This is still hard to read! We can plot our data with ggplot to visualize it instead, but first we need to modify it such that we have a column with the sample name, another with the gene name, and lastly one with the expression value of the gene in a specific sample.  
## For this we use the melt function from reshape2.  
data_compact_df = melt(t(data_df_clean))
colnames(data_compact_df) = c("Gene", "Sample", "Expression")

## stat_summary() defaults to the categories defined on the x axis, and summarizes the numeric spread on the y-axis
## We use coord_flip() to switch the categories to the y-axis, to improve readability
ggplot(data_compact_df, aes(x = Sample, y = Expression)) + stat_summary() + theme_bw(base_size=14) + coord_flip()

## stat_summary with 1 Standard Deviation around mean
ggplot(data_compact_df, aes(x = Sample, y = Expression)) + stat_summary(fun.args = list(mult = 1)) + theme_bw(base_size=14) + coord_flip()

## geom_point to visualize the scatterplot  
## stat_smooth to fit the blue line with confidence intervals in grey
## geom_abline fits an x=y line by default (intercept=0, slope=1).  
ggplot(data_df_clean, aes(x = BRCA1, y = PIK3CA)) + geom_point() + stat_smooth() + geom_abline(colour="red", size=2) + theme_bw(base_size=14)

## We can identify the trends in the outlier sample better with a plot of the quantile ranges. We will use a boxplot for this  
ggplot(data_compact_df, aes(x = Sample, y = Expression)) + geom_boxplot() + theme_bw(base_size=14) + coord_flip()

## We can remove this sample from our dataset by excluding any rownames that have the sample ID.  
data_df_clean2 = data_df_clean[!(rownames(data_df_clean) %in% c("PDX1328")), ]

## Let us update our melted dataframe too  
# First we melt our data
data_compact_df = melt(t(data_df_clean2))
colnames(data_compact_df) = c("Gene", "Sample", "Expression")
# Then we plot it
ggplot(data_compact_df, aes(x = Sample, y = Expression)) + geom_boxplot() + theme_bw(base_size=14) + coord_flip()

table(metadata_df$cl_disease_detail)

## Merge expression and metadata
data_merged = merge(data_compact_df, metadata_df, by.x="Sample", by.y="cl_id")
## Select PDX1258's outlier gene
brca_tspan_df = data_merged[data_merged$Gene == "TSPAN6" & data_merged$cl_disease_detail == "breast carcinoma", ]

## Firstly we update data_df_clean2
## Notice how we select the row with the sample name, and gene with the gene name
data_df_clean2["PDX1258", "TSPAN6"] = mean(brca_tspan_df[brca_tspan_df$Sample != "PDX1258", "Expression"])
## Then we recalculate the melted version of this dataframe
data_compact_df = melt(t(data_df_clean2))
colnames(data_compact_df) = c("Gene", "Sample", "Expression")

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
data(airquality)

## ---- eval=TRUE, echo=FALSE----------------------------------------------
(head(airquality))

ggplot(airquality[airquality$Month %in% c(5,6), ], aes(x=Month, y=Temp)) + geom_boxplot() + stat_compare_means() + theme_bw(base_size=14)

ggplot(airquality[airquality$Month %in% c(5,6), ], aes(x=as.character(Month), y=Temp)) + geom_boxplot() + stat_compare_means() + theme_bw(base_size=14)

ggplot(airquality[airquality$Month %in% c(5,6), ], aes(x=as.character(Month), y=Temp)) + geom_violin() + stat_compare_means() + theme_bw(base_size=14)

my_comparisons <- list( c("5", "6"), c("7", "8"), c("6", "8"), c("7", "9"))
## Plot p-values for specified comparisons
ggplot(airquality, aes(x=as.character(Month), y=Temp)) + geom_violin() + geom_point(alpha=0.5) + stat_compare_means(comparisons = my_comparisons, method="t.test") + theme_bw(base_size=14)

ggplot(airquality, aes(x=as.character(Month), y=Temp)) + geom_violin() + geom_point(alpha=0.5) + stat_compare_means(method="t.test", ref.group = "5") + theme_bw(base_size=14)

# We can also do pairwise tests, but we have to explicitly define the comparisons  
my_comparisons <- list( c("5", "6"), c("7", "8"), c("6", "8"), c("7", "9"))

ggplot(airquality, aes(x=as.character(Month), y=Temp)) + geom_violin() + geom_point(alpha=0.5) + stat_compare_means(comparisons = my_comparisons, method="t.test") + labs(x="Month", y="Temperature") + theme_pubclean(base_size=14)

## We can also plot pairwise scatterplots
brca_df = data_merged[data_merged$cl_disease_detail %in% c("normal", "breast medullary carcinoma"), ]
## Reverse the melt step
brca_df_recast = dcast(brca_df[,c("Sample", "Gene", "Expression")], Sample~Gene)
rownames(brca_df_recast) = brca_df_recast$Sample; brca_df_recast$Sample <- NULL
## Remove the outlier gene
brca_df_recast = brca_df_recast[, !(colnames(brca_df_recast) %in% c("TSPAN6"))]
pairs(t(brca_df_recast), panel = function(...) smoothScatter(..., add = TRUE))

## Selecting samples with a particular disease etiology  
## Select the samples from the metadata dataframe
samples_brca = metadata_df[metadata_df$cl_disease_detail %in% c("breast adenocarcinoma", "breast ductal carcinoma"), ]
## Filter our dataframe based on this list  
brca_cohorts_df = data_df_clean2[rownames(data_df_clean2) %in% samples_brca$cl_id, ]
### Compare this dataframe to what you get with the following command
brca_cohorts_testdf = data_df_clean2[samples_brca$cl_id, ]

# Calculate mean of each gene
avg_genes = sapply(brca_cohorts_df, mean)
# Calculate standard deviation of each gene
sd_genes = sapply(brca_cohorts_df, sd)
# Filter dataframe based on an SD threshold of your choosing
brca_cohorts_filt = brca_cohorts_df[ , names(sd_genes[sd_genes == max(sd_genes)]), drop=FALSE]
brca_cohorts_filt$cl_id = rownames(brca_cohorts_filt); brca_cohorts_filt = merge(brca_cohorts_filt, metadata_df)

ggplot(brca_cohorts_filt, aes(x=cl_disease_detail, y=TFF1)) + geom_boxplot() + theme_bw(base_size=16) + stat_compare_means(method = "t.test")

