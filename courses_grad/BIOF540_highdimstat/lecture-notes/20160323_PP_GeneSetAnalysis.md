#Analysis of Gene Function I  
##Gene Function  
- *Distal* Function, where the gene can be present without the function being present, and vice versa. Ex. Actin function (http://www.jbc.org/content/287/32/??)   
##Gene Ontology  
- Prototype way of annotating genes  
- Controlled vocab for function  
	- Semantic relationships among concepts  
- Most annotations are **IEA**, derived by computational analysis and not by an experiment, and **most not reviewed by a curator**   
	- Is over 98% of the annotations, and stand at par with the manual annotations  
- Fails at species comparisons
	- Currently 60,000 papers with mice annotations suggested, that are yet to be reviewed.  
	- Information about experiments from 1980s still being entered.  
- Confusion between **proximal** and **distal** function. This is left up to curators.  
	- Unstable, since gene function understanding can change over time even (without new data) [http://bioinformatics.oxfordjournals.org/content/29/4/476.abstract]  
	- (check this out)[http://www.chibi.ubc.ca/gotrack/index.xhtml] to track gene annotaitons, cool tool from UBC.  

##Multifunctionality  
- *Some genes have more functions than others*   
- Operational definition: Number of Gene Ontology terms (or other annotations)  
- GO annotation is very uneven: Some genes have no terms, and others have hundreds  
	- Multifunctional genes tend to show up in genomics studies  

##Enrichment Analysis Methods  
###Over representation analysis (**ORA**)  
- Hypergeometric series & binomial distribution  

###GSEA
- Modification of the Kolmogorov-Smirnov test  
- Significance established by resampling (req gene scores represented as correlations, simple experimental designs only)  
	- Vigorous argument in literature about whether this method is good/appropriate/sensible, see pubmed 20048385.  
- Non-thresholding alternatives exist (based on ROC curves, for ex.)  

- Test for multifunctionality effects only if your 'hit list' is biased towards multifunctionality.  
	- Corrections that simply reduce redundancy of gene groups ???  

- DAVID annotations are more than 10 years old. So additional curation is required.  
	- Many annotations are computational, some are manual (20 fulltime people, OMIM spends 100s of $s per annotation).  
	- Negation is difficult to imbibe with NLP methods.  


