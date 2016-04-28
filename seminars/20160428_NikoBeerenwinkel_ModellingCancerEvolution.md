##Computational oncology  
- High-throughput seq data, req statistical modeling  
- Cancer phenotypes studied as links to perturbations at a network level  
- Evolutionary dynamics guide the study of cancer progression  

##Clonal Expansion model   
- High clonality increased incidence of esophageal adenocarcinoma *One of the early studies demonstrating effect of intra-tumor diversity on clinical outcome*    
- **order of mutation matters too!**  (TET2/JAK2 order, Thrombosis in patients with myeloproliferative neoplasm)    

###Modelling of data   
- How much intra-tumor diversity can we expect?  
	- Standard population genetics model is the *Wright Fisher process*  
		- Multinomial sampling in discrete generations (params are pop size, number of driver genes, mut rate, and selective advantage)  
		- Selection (random) from previous generation, and a non-uniform selection of certain alleles/parents that are more likely to be selected as parents (== greater fitness since more offspring)   
		- But even the simplest iteration of this model cannot be solved! Traditionally fixed pop size, but can use a deterministic model to account for population growth. **Use simulation data instead**  
	- Results from simulations / How much can we actually detect  
		- A larget amount of genetic diversity occurs at a single cell level, ~10^-9 relative clone size. Larger clone size matches frequency of mutants to power law. Generally this is the scale of resolution provded by exome seq.  
		- Targeted deep seq can take down to relative clone size of 10^-5.   

###Phylogenetic vs oncogenetic models  
- *Phylogenetic model:* dependencies in tumour samples that are evolutionarily related  
- *Oncogenetic model:* dependencies in genetic alterations across independent tumour samples  

####Phylogenetic model  
- *Infinite sites assumption* : Each mut occurs only once on the entire phylogenetic tree  
- More interested in the **order of the mutations** rather than the exact placement of the individual cells (~mutation profiles)   
	- Model likelihood based on posterior probability, given a mutation x samples matrix, a tree topology with attached samples, and an error rate distribution   
	- Trees that only differ in sample attachment will be regarded about the same - the order of mutations is essentially the same. You integrate out the factor sigma responsible for dictating the sample attachment, for each sample (/cell). Complexity is linear in number of muts (m) and number of cells (n) == O(nm). <-- *marginalization, remove dependence on number of samples*  
- **Problem with sc-seq** : Missing data!  
- *Wang et al, Nature 2014. Single cell sequencing of an ER+ breast tumour*  
- **SCITE**  

####Oncgenetic model  
- Infer partial order among pathways or single mutations  
- Can model (after making assmptions about mut rate, pop size), the fitness advantage carried with the accrual of a single gene mutation over time-period 't'.  
- **pathTIMEx**


