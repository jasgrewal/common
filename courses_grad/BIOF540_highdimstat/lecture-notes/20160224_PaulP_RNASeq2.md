#RNASEQ - Part 2  
##Gilad data set  
~4300 genes had 0 counts in 6 samples  
~7600 had 10 counts total  
196 genes had > 10000  
> TMM + DeSeq normalization gives scale factors for each library (can compare two methods' scaling, should ideally be similar range and values)

#Differential Expression  
- *LIMMA*:  t-test based. P-values should take into account the assumptions taken in the dataset. 
	- The means might be the same but variances may be different. So Heterodscedasticity plays an important role (there's an expecttion of strong mean-variance relationship with count data). 
	- One challenge is that most evaluations are based on simulations, there's no gold standard.
	- Voom is an add-on to limma. Models mean-variance relation preferentially over getting the probability distribution exactly right. Works with log2 counts per million (log-cpm). Assume gene length is constant! 
- Issue with counts when comparing two samples
	- In microarrays, data is continuous. Signal is fundamentally count but values are averaged across pixels and counts are high. So we never really have 0 values - background noise ensures a continuous distribution. The numbers are so high that we can start to approximate them as usual normal distributions. 
	- RNASeq is count based. Count starts at 0. As counts get high, the distinction between Microarray and RNASeq data should diminish. 
		- RNA counts modelled by a Binomial distribution as a function of library size and abundnace. Can approximate it as a poisson distribution. When library size increases and abundance remains low, it starts approximating a normal distribution. The variance of these distributions are an increasing function of the mean in all these cases.
	- In general, read cound data is expected to violate both normality and equal variance assumptions. Can use a non-parametric test like Wilcoxon, or normalization techniques used by EdgeR and DESeq.

- If you took the same sample and resequenced it under identical conditions in two different lanes, then it should follow a poisson or binomial distribution. This happens definitively for technical replicates.
	- However, poisson does not capture biological variability (Biological replicates show divergence from the linear rel between mean and variance provided by the poisson distribution. 
	- Higher variance regions get more weight in minimization, leading to a smaller p-value and subsequent higher number of false positives.

#Methods of normalization
- Can correct this with transformation (log, square root). However, log transform doesn't typically always work that well with RNA-Seq data. 
- Log 'overcorrects' low expression level genes, so now low values are more variable than high values. Qarter-root variance makes distribution more symmetric. 
	- *Law et al, genome biology 2014, 15:R29*  explains biological variability dominating at higher counts, technical (sampling) variability at lower counts.
- Weighted regression approach
	- R & Limma already supported this, but we want to 'care less' about data points taht are less precise. So we add weights to the usual normal equations, and express them in terms of 1/variance (High variance taken less into consideration) - for each gene (take the mean for each gene across all samples. Regress out technical variance in the beginning of the model). This is the Voom approach - note that it doesn't modify the data, only modifies the results of the lmFit call. The Residual standard error estimates are now (hopefully) better, and will be further compressed by limma in the empirical bayes step. 
	- Subsequently plot M-V plots from limma using ```plotSA()```  
	- An alternative method for Voom is ```eBayes(...,trend=TRUE)```, which makes the prior sensitive to the M-V relationship.

##Expected distribution after limma-voom
- If the models were alike, then a uniform P-value distribution 
- If different models, expect a peak near 0 in the P-value distribution
- **This is an extremely important diagnostic plot!**
- If fewer observations at p-value ~0.00 range versus the rest, this implies there are sources of correlation in the data that may not be accounted for (may be a signal but it is not being fit by our model - the p values are not accurate)

**Limma voom is the way to go when you have a good amount of reads per sample, and >3 replicates per condition. Even if you don't, this is a good way to go. **   

##So why use EdgeR or DESeq?
- Some groups use a poisson model. Field moved from that to using negative binomial in a generalized linear model framework
- Initially used to have small sample size and low library size. But that has changed...
- When counts are high, data behaves like a normal distribution anyways. EdgeR and DESeq use negative binomial distribution  
	- NB distribution is a gamma mixture of poisson distributions ~= overdispersed poisson.
		- So now have an extra parameter to estimate, the dispersion parameter
		- Only reason to use it is that it is mathematically convenient
		- However, calculation of dispersion is tricky

###Calculating dispersion in NB distributions
This can be estimated straight from the data for each gene, but hard to trust data from small samples.  
Can also make it a parametric function of the mean (like a quadratic) but methods generally follow flexible approaches of trended values (calculate dispersion of each gene but aim to fit to a trend in dispersion values).  
- EdgeR gives you great p-values with good sensitivity to outliers. Voom is a bit more conservative. *this is a bad reason to use EdgeR ;P*
- DESeq could give you a massive right skew with a high number of observations in the higher p-value range (choose null more often), is more conservative, since it used max of fitted trend and gene-wise dispersion, instead of a moderated disperison like EdgeR does. 

##Wet-lab normalization method
- Use spike-ins (RNAs added in a known amount). Voom has good FDR for 'spike-in' data, and maintains power. EdgeR also does good.  

**Voom might not do as well when sample size is very small, but nobody should be doing N=2 experiments!**  
*None of these methods deal specifically with splice variants; See cuffdiff and DEXSeq, limma:diffSplice or quantify at transcript.exon level and proceed as usual.*  


