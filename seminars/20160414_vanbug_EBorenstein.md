##Intro talk by Thea  
###Normalization  
- Comparing samples  
	- Normalize based on %reads assigned for each sample (From number of reads -> % reads)  
	- Fairly widely accepted course of action  

- Getting meaningful abundances   
	- Different samples can have different genome sizes  
		- So two samples can have same # base pairs (for a given gene) but diff genome sizes  
		- So normalize by average genome size   
##Elhanan Borenstein, PhD  
- Associate prof of Genome Sciences, UW  
**Systems biology, modeling, and cross-meta-omic analysis of the human microbiome**  

###Human microbiome  
- Highly variable across the human body, inside and out   
	- Associated with disease (obesity, for example!)  
- **Why** do different individuals have different communities? And what **forces** determine the composition of the microbiome  
- **How** does the variation in species composition affect microbiome level activity, and the host?  
- How do **taxonomic shifts** contribute to **functional shifts**, how can **target species** be identified  

- Antony Leeuwenhoeck did microbiome analyses on a bunch of people - including *a drunk person!*  <- follow up about this.  

###1683 to 2015  
- Machinery has changed, but it remained a *comparative analysis*   
- Missing a systems biology approach  

####Systems modeling  
- Tools have already been developed over the last few years.

####Cross-omics analysis   
- Meta-Omic Data: look at species, gene compositions, meta-transcriptome, meta-metabolome, meta-proteome  
- Integrative metagenomic browser (Burrito)  
- **FishTaco**: Identify taxonomical drivers of functional **shifts**  
	- **Interesting**: Uses Shapley value analysis to figure out how different species covary in a community, and assign different 'impact' scores to individual species using that.  
	- See species that contribute **against** the shift too. Interesting! But their impact is outweighed by those that contribute to the positive shift.   
	- Ohad Manor's work  
- **MUSiCC**: A framework for accurate functional normalization  
	- Use the genes that are **always** single copy, you can measure abudnace for a community of microbes, regardless of the composition of this microbiome.  



