#What do we mean by DE?  
For RNA Seq, genes or isoforms under consideration?   
	- Science should operate at the transcript level  
	- *as highlighted in Trapnell et al, 2010*  

Reconciling transcript- and gene- level analyses  
	- Challenge with uptake of cufflinks (takes in raw alignments) vs deseq or limma etc (counted features, much more compact, in R).  
	- Counts and fold changes clearly don't highlight gene abundances (Trapnell et al, 2012). 'avg of sum is not the same as the sum of the avg'.  
		- When the same isoform is being measured (re: counts) then raw will cancel out raw. But when isoforms are variable length, then your counts are misleading!.  
		- This is also not justification for doing a wrong thing.  
	- Normalizing abundances by length.  
	- Not resolved even when you go to isoform level, tiny variances in isoforms may not be identified easily, and DE isoform evaluation (test correction is now against 200,000 isoforms, loss of power).  

Sleuth based approach  
	- Can still get gene level significance but by correctly aggregating DE at the isoform level (correct integration of p-values at isoform level, using fishers method).  

**Quantification free DE**  


**Readings Highlighted**  
Zhang et al, 2013: isoform level expression profiles give better cancer signatures than gene expression  
Anders et al, 2015: Count based DE analysis of RNA seq data using R and bioconductor  
Soneson et al, 2015 (F1000): Differential analyses for RNA Seq  


**Methods**  
Fisher's method (for multiple comparative tests, your p values will be uniformly distributed (or not? - thats the test))
Stouffer's method (1949)  
Lancaster's method <-- this is quite interesting (corrects for biases from depth of analyses in different studies?)  


