#SNV distributions (Patterns of mutations, signatures)
*Genome wide scale: influenced by cellular factors  
*Locally: DNA sequence context (role of flanking sequence...albeit unclear)  
- Sequence context dependent mutagenesis at A-tracts and G-tracts (Bacolla et al, 2015)
	- Are abundant in vertebrate genomes; mutations within the tracts occur more frequently than genome wide average, and increase with increasing tract length; 
	- **Length instability is a hallmark of mismatch repair-deficiency in cancers** and occurs due to slippage during semiconservative DNA replication (repeat misalignment)  
	- SNVs occur predominantly at 1st and last base pairs of A-tracts
		- Coincides with the most flexible base pairs for A-tracts
	- SNVs occur predominantly at 2nd and 3rd base pairs in G-tracts
	- Likely based on base-pair flexibility, charge transfer (both local DNA features and long range base-base interactions)
	- Ex. mutator role of activated induced deaminase (AID) in B-cells during class-switch recombination and somatic hypermutation, targets preferentially cytosines within {A,T}{A,G}C  

**European samples have an excess of deleterious variation versus African populations**  
- Deleterious alleles were enriched in runs of homozygosity (Szipech et al, 2013)  

##Patterns of mutations  
- Greenman et al, 2007  
- 1000 somatic mutations, in 274 megabases of DNA (==518 protein kinase gene exons), in 210 human cancers. 73/210 showed no somatic mutations at all!  
- Evidence of driver mutations contributing to development of the cancers studied in approx 120 genes.  

*Biological selection is exerted mainly on non-synonmyous mutations as they may alter the structure and function of proteins*  
- Microsatelite instability (failure of DNA mismatch repair mechanism)  
	- Signaure C>T transitions, C>A transversions  

##Signatures  
- Alexandrov et al, 2013. A signature that contributes the large majority of somatic mutations in the tumour class.  
- Alexandrov and Stratton, 2014  
- Earliest one from UV radiation (C>T, CC>>TT)  
- mutational signatures of carcinogens are left as 'evidence' in cancer genomes (TP53 studies in early 1990s)  
- Aflatoxin (known carcinogen, found in food from south Africa and Asia!!) in hepatocellular cancers, C>A transversions  
- Normal cellular event of 5'mC demethylation results in some C>T mutations at CpG dinucleotides has been observed in all cancer types  
- *Temozolomide treatment (alkylating agent) significantly elevates the # of somatic mutations and results in a distinct mutational pattern of C>T transitions. 
- Several signature transversions associated with error prone polymerase (n, e)
- 6 classes of somatic substitutions (4 distinct processes with different mutational signatures) based on time of development.
	- Initially all mutations in the cell are due to activity of endogenous mutational process
	- [shown here](http://www.sciencedirect.com/science?_ob=MiamiCaptionURL&_method=retrieve&_eid=1-s2.0-S0959437X13001639&_image=1-s2.0-S0959437X13001639-gr1.jpg&_cid=272031&_explode=defaultEXP_LIST&_idxType=defaultREF_WORK_INDEX_TYPE&_alpha=defaultALPHA&_ba=&_rdoc=1&_fmt=FULL&_issn=0959437X&_pii=S0959437X13001639&md5=8b5f571797af2e2e9f9c8c7ea8a8d3c6)
	- The final cancer genome doesn't resemble any of the operative mutational signatures, and some of these processes can be triggered by lifestyle choices.
	- 21 breast cancer genomes - highlighted distinct mutational signatures.
		27 distinct mutational signatures. 22 validated by other approaches, 3 associated with technology specific sequencing artefacts, 2 remain unvalidated (Alexandrov et al, 2013, "Signatures of mutational processes in human cancer)  
	- Mutational signature associated with 
		- mutations in BRCA1/2 in breast, pancreatic. BRCA1/2 are implicated in homologous recombination based DNA ds break repair. So abrogation of their functions results in non-homologous end-joining mechs (uses microhomology to rejoin ds breaks at rearrangement junctions)  
		- failure of DNA mismatch repair pathway in colorectal cancers
		- hypermutation of immunoglobulin gene in CLL
		- pol e mutations in uterine, colorectal cancers  
		- Age of diagnosis  
		- indels (microsatellite instability, defective DNA mismatch repair)  

###Strand bias of mutational signatures
- **Strand specificity** for a higher number of substs on the transcriber strand vs on the untranscribed strand can occur due to the transcription coupled component of nucleotide excision repair (NER) (ex. photodimers due to UV light exposure are repaired by NER and result in a higher number of C>T mutations on the untranscribed strand)  
- Could be indicative of exon-specific repair processes active in the cell  
- *Each of the cancer types has atleast 2 mutational signatures operative in it, whereas some have up to 6 distinct ones
- APOBEC deaminases: 2 signatures (C>T, C>G at TpC sites), observed in 16 of 30 cancer types one of the most significant human carcinogens  


#How are somatic variants called? (methods, tools)   
**De novo mutation rate in humans is approx 1.1 x 10^-8 per haploid genome**  
*Work with consensus calls from 2-3 variant callers*  
Germline muts are inherited from the parents, are present in all cells of the body, may increase the susceptibility of a person to be diagnosed with cancer. **multiple cancer susceptibility loci**  Ex. KRAS mutations in exon 2 for colorectal cancers (treat with EGFR inhibitors)  
***While early methods for genotype calling are based on fixed cut-offs, recent methods provide measures of statistical uncertainty when callign genotypes, and hence might improve the accuracy***  
##Approaches to address non-diploid VAFs
i. Use joint diploid genotype likelihoods for both samples (ex. SomaticSniper)  
ii. Disregard such genotype structure and test whether a shared allele freq between the two samples can be rejected (VarScan)

##Tools
- Strelka:  Bayesian approach (tumour and normal allele freqs are treated as continuous values, normal sample = mix of diploid germline variation and noise; tumour = mixture of normal sample with somatic variation)
- VarScan: Uses mpileup, can be used to call somatic mutations, CNVs, LOHs (t-n pairs), identify germline variants and *de novo* mutatioins. Step for variant filtering that removes likely FPs associated with common sequencing- and alignment- related artifacts.
	- Variants called heuristically, and with statistical test based on supporting read count
	- Meet user set criteria for coverage, number of reads, VAFs, and fisher's exact test p-value
	- Artifacts due to alignment of relatively short (100 bp) read sequences to a ref genome. Alt local mis-alignment near indels. Alt reads with long runs of low base quality.
	
- novoSNP  
- GATK: should not be used to call somatic variants from tumor/normal pairs.  
	- Complete suite. Mainly calls germline variants. 
	- Call SNPs on normal
	- Call SNPs on tumour
	- Subtract SNPs (N) from SNPs (T)
	- **Wrong way!** Tool makes assumptions about allele freqs that are tuned for germline mutations, not somatic ones. Use MuTect instead. 
- Mutect: Designed to detect somatic SNPs
	- No longer ignore sequencing artifacts
	- No germline VAF distribution assumptions
		- Germline callers can bias you towards muts at 50/100% VAF
	- Get rid of all germline mutations
- SNVMix (Goyaet et al, 2010): Independent tumour analysis

##Notes on VAFs
- Expect distribution on 0, 50, 100% for SNV fractions in normal tissue
- Tumours have: normal admixtures (lowers VAFs), subclonal variants, CNVs
	- Germline callers: are ploidy based, have genotyping algorithms (ex. GATK Unified Genotyper, does both variant calling and genotype calling) 
	
#Databases for somatic variants (and application to drug discovery)   
- [Several!](http://www.humgen.nl/SNP_databases.html)
- [Nice summary](http://hmg.oxfordjournals.org/content/early/2013/08/19/hmg.ddt384.full.pdf)
- dbSNP: short genetic variations database, maintained by NIH. Collection of common and rare small germline and somatic sequence variations. *Polymorphism repo*  
- ESP: Exome Sequencing Project
- 1000 Genomes
- **With these 3 dbs, the threshold to exclude a variant as pathogenic must be set high to reduce the risk of false negatives. This is because they don't have phenotypic info**
- HGVBase (Human genome variation database): European (EBI-EMBL)
- HGMD (Human Gene Mutation Database) - published variants present in genes known/suspected to be related to human disease. *Based on curated lit review*  
- OMIM (inherited phenotypes + genes with selected variant info; most often mainly useful in understanding the connection of a specific gene to disease)
- Human SNP database : Whitehead Institute
- Human gene mutation database (UK): paid. SNPs causal for disease. 
- dbGAP: 
- ClinVar: Relationships of genomic variants to phenotypes. Similar to HGMD. Links to 1000 Genomes for variant submission analysis.
- EVS or HapMap database **(to remove common variants, population specific variants)**

*Correlation does not imply causation* 

##Databases associating variants to cancer target drugs
- [DGIdb](http://dgidb.genome.wustl.edu)
	- Sources like DrugBank, TTD (Therapeutic Target Database), PharmGKB)
	- PharmGKB allows to get genotype-SNV linking directly to drug - license req
	- Get about 3200 drugs? + 200 or so?
 	- [Connectivitiy map](http://www.broadinstitute.org/cmap/)
		- Upload a signature consisting of a list of up and down genes. Returns drugs (/drugs + cell line combos) for which the same signature was observed in controlled expression expts.
  
## Annotation tools  
VEP (Variant Effect Predictor): ENsembl's own functional annotation tool. Formerly SNP effect predictor.  
SVA (Sequence Variant Analyzer): Annotate SNPs, INDELs, CNVs. Heavy hardware reqs, could not correctly annotate vcf files
