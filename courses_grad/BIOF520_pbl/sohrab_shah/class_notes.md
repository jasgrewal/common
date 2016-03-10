#Discussion Points
##What defines fitness
- Size of the clone
	- Population dynamics
- Nature fitness landscape of a tumour
- Post treatment fitness landscape of a tumour

##Xenografts
- Injection on the order of millions of cells. 
	- Selection bias (only some will engraft)
- Immunodeficient environment
	- Different environment than primary tumour
	- Test combination therapy + drug dosage
- ? Can transplant human t-cells in the mice  

##How do we define and separate a clone  
- Remove background noise and random mutation accrual
- FACS
	- Need markers
- Whole Genome Shotgun Sequencing
	- Dominant clone can be inferred from allelic fractions 
	- Deconvolve different subpopulations with shared recent mutations but distinct starting mutations
- Threshold for difference
- Cannot assume a single mutation - phenotype causation

##Additional
- Basis for drug resistance
- How does RNA-Seq help in validating 

#Discussion questions
1. What types of genomic aberrations can be determined by WGS?  
- SNVs, indels, CNVs, structural variants (, translocations)   

2. How can one use all mutations in a genome to determine those that might be under evolutionary selection?  
- dN/dS ratio 
- B-allele frequency
- Interactions of mutations
	- Epistatic interactions between mutations (Co-evolution)
		- Determine this how?
		- Do they both increase after treatment?  
- Copy Number
	- Tumour Suppressors: both copies have to be deactivated (ex. truncating mutation with loss of copy number)
	- Oncogenes: copy number gains (amplifications)
 
3. Importance of single cell sequencing? 
- Covered in topics
- Capillary (sanger) sequencing
	- Aggregate signal
	- Low throughput  
	- In germline testing, sanger is still ok, but once you get below <10% VAF and other contamination (stromal, immune response), sanger calls will probably be much less  
- Intra-tumour heterogeneity = fitness opportunity   

4. Normal admixing and how to measure normal contamination. Can this idea be extended to identifying clonal pouplations?   
- Admixture separation is easy, but this idea cannot be easily extended to clonal populations.   

5. Xefnografts and selective pressures thereof. Impact of this on your interpretation of results.  
- different environment than primary tumour. New mutations can be acquired that would be weeded out in a human environment, but could persist in humans
	- Body temperature
	- Ageing
	- Cytokine signalling, hormonal composition
	- *Mice are not humans* 
	- Size of tumours in mice, and impact of that on subsequent population dynamics
		- Mass xenografts
		- Genetic models with pigs (time taken before a tumour might form)  
	- Added subcutaneously, rather than to the exact organ/corresponding site from the primary tumour. Alt. Subrenal capsule.   
- Tumour sample prep before graft  

6. sc-seq importance in understanding clonal dynamics  
- Overview of single cell sequencing
- Circulating Tumour Cells (CTCs) 
	- Does CTC burden vary based on site of collection rel to tumour mass.

7. Stochastic vs deterministic effects
- Replicates (measure of stochastic effects)
	- Different cells from same population (technical replicates)
	- Across different mice (biological replicates)  
	- What do you do if you get different observations from biological replicates?
		- Statistical tests for what's baseline  

8. What's drift, and how does it relate to your problem
- Accrual of neutral mutations
	- Confounders in subclonality
	- Random mutations that have no effect on clonal fitness
- Is usually a result of random sampling

9. Theoretical principles of Darwinian evolution, and how they can be used to tackle this problem. And what fitness is (how to use principles of fitness landscapes in this study).  
- Phylogenetic reconstruction in cancer (and how it is different/same to other approaches)
	- What can happen in cancer genomes that typically does not happen in species evolution
- Phasing and how that influences clonal reconstruction  
- What is a fitness landscape? 
	- *Fitness == rate of proliferation* for cancers
	- [3D landscape](https://upload.wikimedia.org/wikipedia/commons/e/ea/Visualization_of_two_dimensions_of_a_NK_fitness_landscape.png), where you don't have a single highest point  
- How would it change?
	- More ['sea-scapes'](http://www.ncbi.nlm.nih.gov/pubmed/19232770) rather than landscapes
	- External pressure: drug treatment  

10. Can time-series modeling be used to resolve clones under selection?
- Genotype is a tag for a clone
- Multiple sampling of the sample over time, to see change in selective pressures
	- Can use this to overcome the drawbacks of xenografts
	- Evolutionary tract in the mice is still going to be different, but comparing treatment and not-treatment can help model what's the tumour's response to treatment  
- Multiple biopsies of the patient
	- ctDNA (less invasive)  
	- *longitudinal study*
	- Can use it overcome limitations with xenografts  
- WGS sampling over time
	- Mutations proportions changing in a same pattern over time, from bulk sequencing   

11. Limitations of single cell sequencing  

12. How can you use responsive/non-responsive cohorts be leveraged in experimental design and analysis?  
- Clonal heterogeneity
- Mutational profiles of the 2 groups
	- Common mutations in responsive cohorts   

#Presentation
**Talking is better**  
**Talk about what papers you found (state source), and if you encountered the seminal papers in the field**    
- More emphasis on ideas, rather than get caught up in little details  
	- Experimental design, and thoughts on that  

#Questions
How fitness can be modelled using somatic mutation tools?  
i. How do model systems differ from huans (in context of xenografts) **SH**  
ii. SC-seq + allele freq to identify tumour evolution (clonal dynamics) **PR**    
iii. SC-seq overview, artefacts, limitations **MB**   
iv. Statistical methods for determining stochasticity? **GJ**  
v. Phylogenetic reconstruction of tumour? How does it differ from "normal" phylogeny **SB**  
vi. Modelling Fitness Lanscapes of cancer. Changing landscapes (treatment) **JG**   
vii. Time series data -> phylogeny **PP**  
viii. Incorporating longitudinal patient studies (ex. to overcome model limitations) **BC**    
ix. Treatment Response as a factor under study. Different variations in populations.  **RF**  
x. Epistatic evolution processes. Studying and detecting co-evolution in cancers. What are detection methods for determining co-evolution processes in tumours? **TH**  

*Think about targeted sequencing and how that fits into experimental design*  

#Workflow
##Computational
- Shotgun sequencing
- Single cell sequencing
- Infer clonal dynamics  

##Wet lab
Type | response type | replicates | timepoints 
Pre treatment | resistant | 3 | 4
Pre treatment | sensitive | 3 | 4
Post treatment | resistant | 3 | 4
Post treatment | sensitive | 3 | 4
  
This model works with human or mice inputs.  

Clustering of mutations  
