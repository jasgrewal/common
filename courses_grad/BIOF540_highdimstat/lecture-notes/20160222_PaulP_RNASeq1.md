#RNASEQ - Part 1
##Regulation  
With RNA, there are varying levels of regulation: transcription, modification, cytoplasm export, degradation.

##Over the times    
-  Leverage hybridization to measure RNA expression levels in microarrays. Mature, inexpensive, accessible, but only detect what you probe, and cross hybridization can result in background noise and ambiguity (image noise). Saturation can be an issue and resolution of 'high expression' vs 'super high expression' can be an issue.
-  High throughput with RNA-Seq  
	- No longer need prior genome annotation
	- Increased dynamic range + sensitivity
	- Can detect fusions, splicing events
	- Assess allele-specific expression
	- Can increase sensitivity and precision by greater depth sequencing

##Steps for RNA Seq  
-  Data generation
	- RNA isolation + lib prep
	- Sequencing
- Analysis
	- Sequence QC
	- Sequence alignment
	- Gene/transcript quantification

## SEQC (MAQC III)
- Assess accuracy of RNA-Seq across labs (BGI, Cornell, Mayo, Novartis + 2)
- Nature Biotechnology 32, 903-914 (2014)
- Suggested throwing away 1/3 of the low expression genes, to get reasonable results. Although, they already had a lot of coverage (100 million paired reads per sample) so they could afford to throw this high a proportion of reads.
- Suggested micorarrays way to go unless you want to work on splice events.

##Caveats, Things to think about, Methods for normalization
-  To find background, identify genes that should never be expressed in this type of sample (ex. male specific genes in female samples) and use that expression value as a measure. 
- FPKM thresholding does not work since different cells might have different overall mRNA levels.
- Don't do data dredging! Re-filtering to increase sample space even though loosing a bit of power in the process, no good.
- Short reads are harder to map to genome. Average processed mRNA 2 Kbp. Average exon length is about 200 bp, about 9 exons per gene [on average] (http://bionumbers.hms.harvard.edu/search.aspx?log=y&task=searchbytrmorg&trm=exons&org=)
- Sequencers do tend to make errors, influences mapping accuracy.
- RNA Seq [is an emerging technology] (http://www.ncbi.nlm.nih.gov/geo/)
	- Also realise there is a lag, with people currently working with RNA seq data and publishing a couple years later.
- 	- Only major advantage of microarrays over RNA-Seq is that it is cheaper. 
- *Overlapping genes* : Strand specific sequencing is one variant of RNA-Seq. 

##3rd gen
- Regular RNA-Seq with Oxford Nanopore is still a far-away dream
	- Extremely portable, being used to diagnose Ebola currently
	- High error rate

##Processing RNA Seq data
- Raw data format: FASTQ
	- based on FASTA format (Old format)
	- Measure quality using FASTQC. Gives you pretty plots!
	- Read quality tends to drop further and further into the read 
	- phred scores. Phred score of 20 means there's a 1 in a 100 error rate, 30 is a 1 in a 1000 error rate. 
	- GC content, mean quality score distribution, sequence length etc.

- Aligned data: SAM/BAM format
	- BAM is binary version of SAM file
	- Indexing for quick data retrieval by genome coordinates
	- Relatively compact, but can be huge!

- Still working with short reads
	- Difficult to reconstruct structure of original molecule 
	- Transcript quantification is much harder 
	- Works better with longer reads, more depth, less complicated gene structures (higher eukaryotic genomes tend to have complicated genome structures)
	- You can take data at gene level or transcript level quantification, and downstream analysis steps don't change that much. However, the quantification is the difficult part. 

#Expression quantification
- Number of reads mapping to a gene will depend on total number of reads sequenced, and length of a gene.
- Read lengths assume constant gene length, preferable to start working off of those rather than from FPKMs.
- For inter-sample normalization, we have to work within the 'sequencing space'
	- Finite # of reads
	- This means that measuring one gene always decreases ability to measure another
	- Gene1 expressed in sample 1, takes up space from other genes in sample 1 data; Gene1 not expressed in sample 2, doesn't take up space in read counts for sample 2 data! I.e. now we have more 'room' to measure other genes in other samples, confounding differential expression measurement.
	- Correct for this by normalizing for library size.
		- DESeq uses the median count for genes
		- EdgeR uses a trimmed mean (excludes genes where M component or expression level is too high or too low)


