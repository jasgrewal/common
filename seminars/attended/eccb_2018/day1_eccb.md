## Genes  
[Anshul Kundaje's lab's work on making NNs interpretable, author Peyton Greenside](https://www.biorxiv.org/content/biorxiv/early/2018/04/17/302711.full.pdf)  
Deep Feature Interaction Maps   
1 hote encoded input: 1 kb DNA seq every 200 bp across genome  
[DeepLift extracts per node contributions to a decision](https://arxiv.org/abs/1704.02685)  
- Such methods can extract important features  
But how do such features interaction between each other?  
- i.e. effect of one feature is dependent on another feature (base), within a sequence.  
	- Use pairwise motif analysis. Perturb one motif and see effect on another motif.  
	- Interaction = diff(original, mutated motif)   
	- Perturbation of a motif is changing the reference base to a different base.   
- Reliability of feature importance and scores does depend on predictive performance of the model, and the interaction score depends on how you compute feature importance.  

## iRSOM to separate ncRNA and coding RNA  
[Online commentary](https://tanuki.ibisc.univ-evry.fr/evryrna/IRSOM)  
Using self organizing maps   
- SOM is able to reject certain options in case of ambiguity, based on a threshold (between binary output from SOM perceptrons, yes or no)  
- Input is kmer freq, ORF (length, cov, frequency, freq bias), sequence bias (GC content, codon bias etc)  
- Do this across multiple species (animals, plants, bacteria, fungi)  
Method has high sensitivity but lower specificity.  




