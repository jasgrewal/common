#Swabs  
##When to take them  
- Based on symptoms  
- Hospital equipment, hospital staff  
##Where to take them from    
- *C. difficile*  
	- Stool samples (highly pathogenic samples)  
	- Sampling of hands  
- *Enterobactericiae*  
	- Sampling hospital staff   
	- Kp, E. coli  
- *N. go...*
	- UTIs, STIs shiz  
	- Add antibiotic resistance screen if this is detected  
- MRSA (S.aureus)  
- Skin borne pathogens
	- Nose swab better than hand swab in that case  
- Diarrhoea <- stool samples  
- Blood samples are done for gonorrhoea usually
	- Generally not considered though, as most pathogens will be sporulating, or infect the gut.  

#Testing for antibiotics  
- CLSI list of antibiotics to use
	- Based on species  
		- Determine species using gram stain, or other lab techniques  
- Zone of inclusion used to determine if susceptible or resistant  
- Dilution test (dilute and grow, dilute and grow)  
	- Whichever concentration does not grow is the minimum inhibitory quantity for antibiotics  
- Diffusion test most straightforward one  
- **IO**: Grow on plates, identify antibiotic resistant species/samples for each sample   

#High throughput (rapid genotyping)  
##PCR  
- oligonucleotide arrays (not rapid)  
- strip hybridization  

##Current assays
- Detection assay  
	- Antibiotic resistance TB (German company). Probes/primer pairs.  
- Pre-amplify probes  
	- amplify with mutant specific primers   

#Biomarker discovery/validation  
- IRDB, or CARD as sources for antibiotic resistance screening  
	- If not found in these, do *in vivo* cloning of specific mutations and see if that confers antibiotic resistance  
- HMM-er on new genes  
	- Homology search  
	- SNVs and CNVs  

#WGS Assembly  
- Ragout gives multiple alignments with phylogeny  
- Align to *reference*. How to choose?  
	- identify the novel genes  
- Plasmids/vectors  
- **IO**: input sequencing data, output assembled genome (?)  

#Phylogenetics  
- Input WGSS  
	- assembled reads are the ones that go into **MSA**  
	- but these need to be **annotated** if we are using marker genes  
- **IN practise**, if you have a bunch of closely related isolates, they only differ by a few SNPs  
	- Can look across the strains for these differences  
	- Can skip the entire MSA by selecting the limited set of isolate set specific SNPs, and that's the set of your variants under consideration  

#Contact network  

#Variant calling
- Preceded by mapping to reference + plasmids of interest  
- results in a panel of SNPs for consideration  


#



