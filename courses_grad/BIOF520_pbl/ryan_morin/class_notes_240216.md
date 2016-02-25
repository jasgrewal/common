#Introduction
Oncogene: When activated, motivates cell growth and additional features that may impart survival advantage to the cancer cell. ex. EGFR, PIK3CA
Tumour suppressor: When activated, suppress excess growth. Inactivation leads to growth of cancer cell. These could be inactivations in DNA damage repair mechanisms too. ex. TP53,
 
#Hallmarks of pre-treatment cancer:
- Angiogenesis
- Evasion of apoptosis
- Self sufficiency of growth factors (EGFR)
- Telomere extension (if telomeres deplete, chromosomes end up being sealed to different other chromosomes, lead to cell death). *telomerases*
- Uncontrolled growth
- *debatable* : Activation of alternative pathways for nutrition (ex. hypoxia, glycolysis)
- Loss of DNA repair machinery, or acquisition of genomic instability
- Invasion/metastasis (mobility). *Note, for ex, leukemia is already motile, in a way*
- Immune system evasion - antigen presentation. Non-self peptides presented = alien cells; lack of expression of any peptide on surfacei, shut down MHC pathways = blinding the immune system; PDL1 presentation and binding to T cells tells them not to infiltrate the region with CD8 cells. 
- Insensitivity to external signals (apoptotic signals, negative cytokine signalling)

#Genetic changes that facilitate the changes that induce a cancer
- Acquisition of a mutation that imparts growth advantage
	- Effectively it is Darwinian evolution
	- Need variation and selective pressure (variable fitness)
	- Since this is random and some cells might have a high rate of mutation acquisition, some cells will be dying off (less fit populations)
	- Additional acquisition of passenger mutations, that do not confer a fitness advtg but are present just due to genetic drift
	- Driver mutations confer a selective advantage (see hallmarks of cancer)
	- Detrimental mutations will lead to dying off of respective cell(s)
	- Passenger mutations - all mutatoins accumulated that don't directly confer advantage
- What do driver mutations generally do
	- Oncogenes: recurrent activating mutations (mutation hotspots).
	- Tumour Suppressors: loss of function mutations (deletions, frameshifts, nonsense mutations, synonymous mutations)
	- DS break, frameshifts (INDELS)
	- translocations can bring strong promoters/enhancers near oncogenes
		- *similarly, repressors moved closer to tumour suppressor genes* **examples?**
	- gene fusions ex. BCR-ABL
- Non synonymous mutations
- Inversions
- Translocation event: inter-chromosomal non homologous end joining after DS break. 

- 2 hit hypothesis 
	- usually need atleast 2 inactivating mutations in tumour suppressor gene (diploid organisms!). Ex. elephants have lots of copies of p53 gene, need a lot more cell divisions before their cells can go crazy with mutational acquisition in p53.
	- 2 diff mutations on two different alleles, or loss of heterozygosity with non allelic homologous recombination (repair mechanism as a last resort)

#Interpreting raw sequence information
- Germline vs somatic mutations: 
	- SNPs are common in the population
	- SNVs are rarer mutations
	- Non-SNPs are germline rare variants 
	- What's left is the somatic mutations
- How many average somatic mutations would we expect to see?
	- Depends on the type of cancer
		- Melanoma, lung cancer  
- Synthetic lethality
	- Therapy in case of Loss of BRCA1/2  
	- knock out a parallel pathway that's used to repair the genome (PARP inhibitors!!)
	- So the only parallel pathway for repairing genetic damage is shut off, cells die.  

**Cancer therapy, chemotherapy especially, can in turn contribute to development of new driver mutations**  
*Some cancers have driver mutations (hypermutated samples - distinct from cell populations with distinct subclones) at an elevated level, and patients with this prognosis tend to cure more easily since their genomic stability is already highly compromised*  

##ctDNA
- Tumour evolution insights
- Multiple liquid biopsies (less invasive)
- Track tumour burden / size
- Half life of ctDNA (or cfDNA) is about an hour
- Patients with a good response to tumour is expected to show up as 1 copy per 1000 copies of genome
- Patients with poor prognosis can have extremely high tumour derived DNA
- Even if clinically you have no disease, you are in remission (tracking if tumour comes back, or if tumour cells have completely left the body)

#Questions
At the level of different mutation types, do these happen with equal probabilities at different regions of the genome? Does that impact our ability to read the genome and interpret the mutations? 3D structure of chromosomes, chromosomal packaging? 
i) Is the local frequency of different types of single mutations uniform and random at different regions of the genome? Patterns of mutations, signatures. **Jasleen**
ii) Is the local frequency of different types of Structural Alterations unifrom and random at different regions of the genome? **Matt**
iii) How do we get simple somatic mutations (point + indels) (from WES of tumour + germline)? - mechanism of detection, algorithms, tools (examples) **Jasleen**
iv) What is the average mutation rate in different cancers, how does that change? **Rachelle**
v) Describing all the structural alterations in greater detail (mechanisms for acquisition, and what they can result in in the cell, their relevance in cancer, what can assembly get you). **Prasath**
vi) Gain and loss of genetic material (CNVs) - mechanism of detection, algorithms, tools (examples) **Golnaz**
vii) How can RNA-Seq data be combined with somatic genetic data to identify potential cis-acting mutations? **Tony**
viii) Bisulfite sequencing to identify methylation in tumour suppressors - are there drugs that alter the epigenome? Reversible silencing of tumour suppressors in the epigenome. **Phil** 
ix) Algorithms that exist to determine frequently mutated genes? **Ben**
x) Algorithms that exist to determine frequently copy number amplified regions (CNVs)? **Matt**
xi) Fusion transcripts detection using RNA-Seq data **Sam** 
- *Fusion transcript prediction from genome can be restricted by - translocation not really translating into a functional product, or translocation of two genes that are not expressed ever in this cell type anyways*
xii) Immunotherapy and cancer - cancer vaccines. What goes into understanding what information is needed (non-self antigens) to generate such vaccines. **Shams** 
xiii) Databases of genetic variations that exist already - for SNVs, SNPs, somatic variations, and how they can be used for prioritization of variants and drug discovery **Respective mutation people refer to answer this question for their section**
xiv) Existing driver mutations targetable with existing drugs, certain cancers more amenable to drug targeting due to low mutation burden **Rachelle** 

*Keep in mind there is different information that you get from WGS vs WXS. Can you get CNVs from WXS, for example?*

Mine: i), iii), xiii)
