#Overview
- Natural selection is an ongoing process in pre-malignant and neoplastic cells. 
	- **Heritable** *variation* in the population that affects **Survival or reproduction**, i.e. fitness. 
		- many genetic + epigenetic abnormalities in neoplasms can be neutral, some increase proflif, others decrease rate of death (apoptosis)
	- Expansion of 'fit' clones == clonal selection in cancer
	- *Developing cancer == successive waves of clonal expansions within the tumour*  
- Chemotherapy as a form of **artificial selection** that leaves behind resistant cells
	- but there is **Multilevel selection**
		- *organisms* selectively enrich for genes and tissue structures that suppress cancer
		- *cells* select for increased proliferation and survival, pro-cancer behaviour
	- sources of genetic variation
		- **System instability** across the genome. High level of heterogeneity feeds into somatic evolution
- So essentially, each genetic population can be understood to have it's own environment, and with respect to that environment, a particular fitness. 
	- In an adaptive landscape, the fitness (or height of the peak at a point that represents a genotype) can change with changes in population densities, survival strategies
		- **Frequency and density dependent selection**, based on how well other species of cells are doing
		- **Evolutionarily stable strategy** makes you the dominant population, since populations at local/global minimas on the landscape are prone to invasion
	- As the underlying genetic code changes, there's a constant shift in the valleys and peaks in a cancer population
- The phenotype is a function of the allele, the genetic background in which it ocurs, and the environmment where the mutational effects are expressed.  
	- *Chari S, Dworkin I (2013). The Conditional Nature of Genetic Interactions: The Consequences of Wild-Type Backgrounds on Mutational Interactions in a Genome-Wide Modifier Screen.*  
	- Genetic modifiers have a significant interaction effect with genetic background  
		- Strain specific sensitivity to genetic perturbation  
	- **Epistatic** process, where one gene mutation influences other genes' mutations and fitness
##Genetic events and their effects on fitness
- Large scale CNVs (aneuploidy) is a highly accessible mutation, that can produce large effects on cellular phenotypes (several genes changed simultaneously)
	- genome instability and aneuploidy create a formidable positive feedback loop that may 'switch on' aggressive cancer phenotypes and catalyze emergence of drug resistance
	- in general, have been shown to reduce cellular fitness though.
	- **large phenotypic leaps** in a single mutational step
	- When cells already at a fitness peak, aneuploidy may cause a fall from teh peak == **reduced fitness**
	- But when cells in a fitness **valley**, ex when under severe stress or growth inhibition, large effect mutations can have a better chance to cause a large leap in the fitness landscape, whereas **small-effect mutations like SNVs** would be less likely to result in significant fitness advantage in a single mutational step. 
	- *So aneuoploidy is context dependent, based on the shape of the fitness landscape and initial position on the fitness landscape, plus nature of specific aneuploidy under consideration*  
	- Research has shown *aneuploid mouse embryos show a set of shared developmental defects*, as do primary cell lines derived from these mice  
	- Acquisiton of aneuploidy **provides increased fitness during evolution of antifungal drug resistance**   
>  Pavelka et al, Dr. Jekyll and Mr. Hyde: Role of aneuploidy in cellular adaptation and cancer (2010)  

- Fewer stem cells
	- Limits somatic cell evolution since small population sizes are more favorable for mutation fixation, even for disadvantageous onces (ex. ones for genetic instability), which get fixed by genetic drift.  
	- ** Hierarchical organization of tissues ** with a few stem cells maintaing a tissue == wonderful strategy to isolate inherently dangerous cell expansion to short-term progenitors == potentially oncogenic muts get flushed out. 
	- As you get older, there is lesser cost associated with shifting from the wt genotype peak to the malignant genotype pool as the valley sort of gets filled out by mutations **!!!**  
	- **IN MICE** there's a similar rate of incidence of cancer (humans have 20x longer life than mice, yet largely avoid cancer until after 40 yo). H & M have similar number of tumor suppressor genes. 
	- **Peto's paradox** : how can large animals effectively avoid cacner
		- delayed cancer development results from improved/prolonged somatic maintenance
> Argument present by James DeGregori, "Evolved Tumor Suppression: Why are we so good at not getting cancer" (2011, Cancer Research) [here] (http://cancerres.aacrjournals.org/content/71/11/3739.full.pdf+html)  

- Cancer cell plasticity (stem cell theory)
	- Cancer Stem Cells allow tmor cells to switch (reversibly and rapidly) between CSC and more mature states
		- Based on developmental changes driven by regulatory pathways, not evolutionary changes driven by genetic mutations 
		- Thus, occurs **without altering the genotype**, alters phenotype
	- Gene regulatory networks are full of **feedback loops** that produce stable attractor states, that the cell has to occupy. *When we introduce instability, a network an produce **multiple** attractor states.*
		- Each distinct phenotypic cell state is automatically an attractor state of the GRN
		- However, GRNs are **non conservative systems** far away from thermodynamic equilibrium, so landscape ~= seascape really.   
	- **Epigenetic** and **fitness** landscapes, (regulatory space vs genotype space)
> Sui Huang, "Genetic and non genetic instability in tumor progression" (2013, Cancer Metastasis Rev) [here] (http://download.springer.com.ezproxy.library.ubc.ca/static/pdf/695/art%253A10.1007%252Fs10555-013-9435-7.pdf?originUrl=http%3A%2F%2Flink.springer.com%2Farticle%2F10.1007%2Fs10555-013-9435-7&token2=exp=1457979126~acl=%2Fstatic%2Fpdf%2F695%2Fart%25253A10.1007%25252Fs10555-013-9435-7.pdf%3ForiginUrl%3Dhttp%253A%252F%252Flink.springer.com%252Farticle%252F10.1007%252Fs10555-013-9435-7*~hmac=33ad71083b8c0e99b3f95a8a3e455a7a11792c3d10a3d98c6089cd91e1abffd0)  

##Mustonen and Lassig, 2009 (Cell)
- *From fitness landscapes to seascapes: non equilibrium dynamics of selection and adaptation*  
- **Positive selection != adaptation**
- Evolutionary equilibrium
	- Beneficial changes still occur, repair previous deleterious changes and restore existing functions
		- Likelihood of repair of an inactivated gene in a clonal expansion process is highly unlikely though
	- **Adaptation** is a non-equilibrium response to changes in selection
		- genomic response to time-dependent selection 
		- Requires surplus of beneficial substitutions over deleterious ones
	- **Majority of beneficial mutations identified by population-genetic tests have moderate selection coefficients**
		-  A weakly beneficial change might just compensate a previously fixed weakly deleterious change, without any change in selection
- Look at yeast and Drosophila genomes
	- How can you infer adaptive evolution, in the presence of positive selection? 
- Molecular evolution
	- Non synonymous mutations (amino-acid changing ones) are under negative selection (demonstrated by substantially reduced substitution rates compared to synonymous mutations)  
	- Regulatory elements
		- **A Sweep**, rapid fixation of a selected mutation, reduce polymorphism of linked polymorphic loci in its neighbourhood
		
##Dr. Sohrab Shah's talk [feb 2nd, 2016](https://simons.berkeley.edu/talks/sohrab-shah-02-02-2016)

##Modelling dynamic landscapes (Grefenstette, Evolvability in Dynamic Fitness Landscapes: A genetic algorithm approach (1999, IEEE))
- Two mechanisms for tracking optima in non-stationary environments
	- Global hypermutation could occur at intervals
		- kicks population into a temporary random exploration mode
	- or, a fixed %age of the population could be replaced by *random immigrants*   
- Mutation models themselves
	- Can be traditional (all members are subject to same level of mutation) - **fixed mutation model**  
	- Can be cases where mutation rates are genetically controlled - **genetic mutation model**   
	- each of these cases can be hypermutation models too, where a fration of the pouplation is replaced by random individuals in each generation, while the rest are subject to baseline mutation rates.  
##Miscellany
###Clever chemo
- Facilitate favorable conditions for cells with least resistance to chemo drugs to become more fit and outcompete the rest of the population; prior to chemotherapy.  

###Oncogenetic Trees
These represent the common sequences of genetic events during tumour progression. Don't show common ancestory (as required by phylogeny)
