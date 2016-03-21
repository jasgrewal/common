#Metagenomics  
##Some important pipeline outputs to consider  
For Taxonomic Classification  
### **16S** RNA, conserved but with some variation to be able to characterize different prokaryotes
- bacteria, archaea
- eukaryotes don't have 16S, they have 18S
- targeted PCR (primers sit on hyperconserved regions, cover hypervariable regions)
	- Limitations: 
		- can get you across genus, but do you get additional discrimination of strains from that onwards?  
		- missing other organisms in metagenomic samples that do not have 16S RNA
		- 16S copies can go up to 20 for a bacterial cell (biologically important genes tend to have multiple identical copies. Ex. in humans, 18S RNA copies can go up to ~100)  
	- Benefits:
		- cheaper
		- Lesser noise in 16S  
		- Still a good way to assess microbiome diversity  
- Use the hypervariable regions to separate out species  

### Other organisms 
- viruses, protists  

### Other genetic markers
- Can do a similar amplification of marker gene approach for other genes as well.
- **Alternative methods** like sc-seq, PacBio, WGS, hybrid approach

### Other questions
- How quantitative is any metagenomics approach? Consider this and how 16S copies can confound analysis.  

##What happens when specific species have other variants in 16S RNA 
- "We don't like to talk about that" :P  

##What makes metagenomic datasets difficult to analyze
- Phasing of variants 
- What makes a species a species, how are these characterized?

##When do you know you've reached the required depth
- Not a poisson function of read count per gene
	- What does a distribution of read counts per ? look like (consider shotgun, 16S, sc-Seq) 
	- Number of unique organisms as a function of sequencing depth:
		- It is a sigmoidal curve? Plateaus upwards at a point? 
- **Takeaway point** : Not always able to characterize everything  

##Can assembly be helpful for your analysis?
- Avoiding misassemblies  
- Confounded by homologs and paralogs, 
- Special assemblers for metagenomic studies exist. How do these work?  

##Is BLAST good enough
- BLAST assigns sequences (based on similarity) to different species
	- So it will always try to find a hit for a species. It is heuristic though, so if 2 species show up as top hits with only a single base difference between them, you get a lower confidence for genus vs species specific assignment.  
	- Algorithmic drawbacks?
	- Inflated diversity with same hits to multiple species? Too many potential false positives being added as a result of BLAST search.  
- Other algorithmic methods for fast classification?  
	- kmer based approach (BLAT, MRFAST, MRSFAST) : number of kmers shared?  
##Ideal vs Practical methods for sampling
- Dealing with contamination
	- Fecal samples (small intestine, how much is represented in the stool sample? Alternatively use colonoscopy, opportunistic sampling) 
	- Human microbiome is already pretty diverse (account for ethnicity, diet, stress levels....). Twin Studies???  
	- What have studies in microbiome diversity characterized population differences?   
- Serotonin and the blood brain barrier!

##Considerations for getting a good signal
- Sequencing depth
- How many people are you going to requirement to have enough assessment of a good signal? Would you want to sequence the same person multiple times?  

#After looking at some preliminary data
##Do these results make sense?
- within isolate diversity is to be expected
- But unable to classify to known organisms for **some** isolates
	- WGS data
	- What method did the group use to classify?  
	- It is only in *some* isolates so that's an interesting biological question to follow up on and investigate

##Phylogenetic analysis of a metagenome
- 16S can be an easy tool to measure this
- Assumptions for a phylogeny
	- A mutation at a spot will not arise by random chance in 2 different colonies  
	- Evolution from **a common ancestor**  
	- Horizontal Gene Transfer, plasmid genome integration, extraneous DNA uptake (competent cells)  
- In a treatment versus control, you can see how the phylogeny changes 
	- **Phylogenetic networks** 

##What do you do with read sequences of novel organisms?
- Assemble and submit to NCBI  
- What else?

##Functional role of gut microbiome?
- Proliferative advantage
- Survival advantage (disease resistant, vitamins)  
- Is the understanding of functional profiles contingent on characterization as a species.  
- Methods for analysing functional elements from metagenomic data, with an emphasis on metabolic pathways perspective?  

##Functional roles and link to an ecosystem  
- Operons, metabolic pathways, and dependence of bacteria to each other.  
- codependence of microbes (one of the prohibitions for culturing in vitro).  

##What makes a different bacterial species?
- 97% sequence similarity for genus approximation? A rough estimate, and for 16S.  
 

