#[What is BLAST] (http://mmbr.asm.org/content/72/4/557.full)    
- Identify homologs in reference sequences    
- Earlier methods (Smith Waterman) do **Full alignment**, O(n^2)  
- BLAST does not do full alignment. Instead, only searches for more 'significant patterns' in the sequences  
	- Locate short matches between the two sequences (seeding)  
	- Use a scoring matrix to extend alignment with new words (**ex. BLOSUM62**)  
	- Original BLAST generated ungapped local alignments  
	- BLAST2 produces a single alignment with gaps that include all of the initially found HSP regions   
- Alternative methods: BLAT (uses k-mer indexing of db, can find seeds faster), DIAMOND  
- Used in community composition estimation for metagenomics  
- **Cornerstone** is all-against-all comparisons. ScalaBLAST is used to compute pairwise gene similarities at AA level - computationally expensive.
	- Alternatively, can use profile scans of databases like TIGRFAM, PFAM, COGS (protein level comparisons). But **new families cannot be identified** by this approach.    

##Reference Databases used    
- NCBI, KEGG, GenBank, SEED   
- rRNA dbs: NCBI-nr, Silva, Rfam  

##Drawbacks   
###Poly clonality?  
- Composite dominant population genomes are **not clonal** due to natura lgenetic variation.    

###Based on genome profile   
- Larger genomes are expected to generate more matches than smaller genomes.  
	- *Assessment of gene abundance, * **not organism abundance**    
- Closest hit is not necessarily nearest phylogenetic neighbour, [see](http://link.springer.com/article/10.1007%2Fs002390010184)   
	- *But it always tries to find a hit*, even if **distantly related homologs** the only ones available in the ref database.   
- Potential for **horizontal gene transfer**   

###Current issues   
- Poor representation of microbial diversity by sequenced isolates (problems growing cultures in vitro and isolating etc.)   
- Currently, BLAST-based **composition estimation** currently overestimates the *abundance of* **highly covered taxa** like Proteobacteria and Firmicutes.     

####Algorithmic drawbacks    
- hueristic, local search (seed based)  

####Database drawbacks  
- Low overall incidence of marker genes  (~1%) in the metagenomic data set  
- incomplete and biased reference database  
- difficulties with tree building  

###Enter MEGAN  
- MEGAN helps overcome enrichment bias   
	- Assigns sequence fragments to **lowest common ancestor** of the set of taxa that it hit in the comparison (reduces false matches).    
	- As a negative efect, get a lot of **high level groupings**, or no classification.   
- **Breaks down to reference database quality**  

#Alternate methods?   
##Binning   
- Associate sequence data and contributing species  
- Assembly problem  
- BLAST can be used to bin a larger cross section of sequence fragments to phylogenetic groups

##Composition based methods  
- Supervised ones (need models trained on classified reference sequences)   
	- Ex. Phylopythia (uses sample specific models, gives most specific and sensitive binning)   
- Unsupervised ones  
	- Phylogenetically novel populations, that lack related sequenced taxa, can potentially be binned by shared sequence composition features. **Still relies on sequence similarity to ref orgs** to cluster fragments.  
	- Tend to focus on high-abundance / major classes in a data set.   



