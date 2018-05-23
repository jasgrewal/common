#Intro
-DNA methylation most commonly used for epigenetic analysis
	- easy to study (although it is not the only epigenetic mark)
	- stable (more so than RNA)
	- Nature reviews Genetics (Feb 2013, Smith and Meissner) quite good
-Random selection against 5mC's (CpGs are the least frequent dinucleotide, except at CpG islands which are mostly unmethylated)
	- CpG islands often found at promoters of primarily housekeeping and developmental genes and resistnat to methylation
	- CpG island roles tend to be housekeeping, remain unmethylated most of the times
	
-Roles of methylation
	- Gene silencing
	- Role in splicing **(changes in splice variants due to methylation)**
	- Important for lineage markers in cell differentiation
		- Blocks of CpG are methylated in specific patterns
	- Enhancers are not always associated with CpG islands. Can be nearby but never in them.

- Array based methods are more popular currently than sequencing
	- Cost, speed, effectiveness  
	- Type 1 probes in islands, type 2 are not (Illumina Infinum HumanMethylation450 Beadchip problems)
		- Technical bias!
	- Measure on the array is not representative of the genomewide state  
- ctDNA methylation studies **Someone has done this at the genome sciences centre!**
	- necrotic/apoptotic cell derived DNA has very weird DNA methylation patterns (more tending towards intermediate rather than bimodal)
		- Look into this?
- Statistical analysis
	- M value vs beta value	
	- M value also works on bimodal distribution but preferred (log transfrom from beta, in principle)
	- M values are not biologically meaningful (0 being 50% methylation, range is between -6 and 6), report beta values for biological significance interpretations

## Quality control
- Looking for uniformity in clustering, measurements
	- Identify outliers
	- Match with metadata
	- are there a lot of failed samples/problems?
	- any large batch effects, unusual patterns
	- any large mismatches with metadata?
- Normalization
	- Type II Probes don't have the same dynamic range (less than in Type I probes)
	- wateRmelon package 
		- Normalization will depend on tissue type and number of tissues
		- Apart from that normalization techniques are similar
		- Usually apply 2 normalization approaches to same dataset for concordance (use some reliable metrics, not like density etc. **Check replicates and see if correlation is improving after normalization**)
	 	- wateRmelon pckg has all 15 different methods in it, and 3 metrics to evaluate. 
	- Quantile normalization step
		- Quantro is a test that sees if global differences in groups are different enough that you need quantile normalization (*When to use Quantile Normalization, Hicks and Irizarry, 2014*)
		- BMIQ and Dasen

## PCA as a tool
- totally unbiased (not driven by metadata) way of seeing patterns in your data
- PC1 is always cell type when working with methylation data
- Note that you can run COmBat to adjust batch effects for RNA-Seq(M) data

## Differential methylation analysis
- Use Limma as always
	- effect sizes are small from methylation changes though (Except cancer, between tissues)
	- What's a biologically meaningful change? Dependent on purified vs mixed cell types

###Multiple testing
- Bonferroni too harsh 
	- Use a higher FDR (upton 0.2 sometimes!) and add a biological cutoff
	- This is done on single CpG iteratively though, like limma.
- Can group CpGs in biologically relevant features
	- **BUT** they are heavily biased, advise against them.
	- ex. Aclust (assumes all sites in the cluster behave the same way)
	- very powerful where you see 'BIG' changes, ex. in cancer
- Influenced by which mehtylation mark you are looking for
	- For ex., hydroxymethylation is very low signal, hard to identify

#Epigenetic clock
- 300 CpGs enough to predict someone's age! (Paper in Genome Biology)
- People who have higher methylation than their chronological age die 25% quicker than people who have lower methylation than their chronological age! 
- **The Epigenetic Clock**

***ULTIMATELY, Verification, Validation, Replication***
	

	
