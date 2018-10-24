[Schedule](http://eccb18.org/workshop-6/)  

## Regulatory network inference with boolean models  
Conversion of network inference problem into a set of logical constraints (yordaniv et al, 2016)  
Proof of monotinicity in xor functions - why isnt this provable?  
Training a regulatory network on transcriptome network, validate on chipseq (2016 paper integrating ChIP-Seq data using bayesian framework)  
https://www.ncbi.nlm.nih.gov/pubmed/27479082/  
https://academic.oup.com/nar/article/45/1/54/2605711  

## Manatee invariants and functional analysis in complex networks   
- Ina Koch's group, Frankfurt  
- Analysing signaling pathways.  
	- Integrating feedback loops and signal integration of crosstalk  
- Abstract petri net formalism to approximate stochastic modelling  
	- Molecular petri net, objects transitioned using specific firing rule.  
	- Gillespie algorithm applied in asynchronous graphs for transitions.  
- Transition invariants can't represent signal flows from receptor to cell responses in cycles  
	- Compute linear combinations of feasible TIs to formulate manatee invariants  
	- TI feasible if all transitions of TI can fire as firing sequence (no preconditions on different objects in graph, can all fire without requiring a prior active state). Firing means all objects connect from receptor to response, along the signalling pathway elements.  
	- Automated computation of signaling pathways. Feasibility of transition invariants depends on additional marking of players (concentrations and connections).  
- Network development (receptor to response) is built with manual literature review.  
	- contradictory statements in literature for connections. 
	- Can you do probabilistic dropout of certain connections across multiple runs to transform this network into a stochastic model?  
 
- Challenges going forwards are with integration of molecular data (how to standardize data?), hybrid modeling methods, topological networks.  
 
Really cool!: [This method can be used to predict knockouts in signaling pathways](https://academic.oup.com/bioinformatics/advance-article-abstract/doi/10.1093/bioinformatics/bty700/5068592?redirectedFrom=fulltext)    

[Interesting 1993 paper about mathematical formulation of invariants at steady state](https://link.springer.com/chapter/10.1007/978-3-322-85017-1_9)  

## Logical modelling for predicting anti-tumour response to Checkpoint Inhibitors  
- C Hernandez et al (Paris)  
- Dynamically model T-cell co-inhibitory pathways  
	- Requires molecular mapping of CD4+ T-cell activation based on GINsim,CellDesigner pathway sets and annotated data.  
	- Fit dynamic model to this network  
- Assessing correctness of model in reproducible way?  
	- CoLoMoTo docker and unit testing   
- We can now investigate sub-models similarly  
- Percolation analysis to understand the impact of checkpoint inhibitors  
	- Can fix the value of certain components, and calculate the percolation across downstream components (/genes) as a consequence of that fixed value.  
	- Does the logical rule of the relationship defined when building the network impact the rcolation?  
		- robustness remains to be evaluated  
	- Activations differ strongly between CTLA4 and PD1 (former very specific, PDL1 more diffused).  
		- Could be a consequence of more literature (longer time of discussion) on CTLA4 vs PD1 which is only a focus of attention over the last 10 years.  

## Identification of Diagnostic and Therapeutic Markers in Tumor Invasion using Logic-based Modeling   
- Faiz Khan (Rostock, Germany).  
- E2F1 interaction maps used to build network (literature mining + database + domain knowledge)  
	- Structural analysis of network using graph theory  
	- use input data (gene expr) to identify core regulatory network  
	- logic model built to predict disease molecular signatures  
- Stimulus response behaviour & perturbation analysis.  
- Khan et al, Nature comm 2017, [discusses the method in detail](https://www.nature.com/articles/s41467-017-00268-2)  

## Clinical info from prostate cancer using logical models  
- P_Sy0 11, 22, 23  








