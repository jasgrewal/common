#**A practical introduction to using HGVS with python**  
*Presented by* [Reece Hart](reece@invitae.com)  
*Slides available* [here](https://docs.google.com/presentation/d/1XTvotT6YCsagH0t6tGnCgJhYbHTw1FPwLrPS_sdF_wk/edit#slide=id.g1795fef191_0_51)  
[Setup](https://docs.google.com/presentation/d/1XTvotT6YCsagH0t6tGnCgJhYbHTw1FPwLrPS_sdF_wk/edit#slide=id.g1795fef191_0_521)  

=======  
[**HGVS nomenclature**](http://varnomen.hgvs.org)  
- <sequence>:<type>.<position+edit>  
	- type in {g, c, p}, ex. {genomic, cellular transcript, protein}  
- Parantheses around a variant imply it is uncertain  
- Normalization of sequencing in cases of indels in repeats which result in the same phenomenological sequence  
	- VCF shifts towards 5' end  
- 1033 RefSeq transcripts-genome alignments (422 genes) have indels  
	- A deletion at one end can be adjusted if there is no gapped alignment for the read. But if there is a gap in the alignment, the interpretation differs.   

=======   
**_hgvs_** [Python package](https://bitbucket.org/biocommons/hgvs)   
- [Web interface](http://variantvalidator.org)
- Allows you to parse variants into different computer friendly formats like JSON  
- Supports a subset of HGVS variants (not all - grammar drawbacks for parsing)  
	- *What's not supported*: Fuzzy variants/locations, chromosomal fusions  
- After parsing, can project between aligned genomes/trascript/protein sequences.  
- Can also do variant normalization (shifting, shuffling)  
- Handles regions of 'reference to transcript' discrepancy   
*Issues/General comments*  
- Variants can be mappable to different assemblies  
- Set up local SeqRepo (look up later) as local source of sequences, add sequences as per need. Space efficient storage on a single machine, can set up RSync in it.  
- NCBI stores alignments for current accessions for current genomes.  
	- Enter **Universal Transcript Archive** (UTA)  
		- Transcript-genome alignments from multiple sources, versions, and alignment methods  
		- For ex., when it comes to alignment methods, NCBI uses SPLINE, UCSC uses BLAT  
- **INSTALLATION** `pip install hgvs` (`brew install postgresql` first)  

======  
*Using hgvs*  
[iPython notebook]()   
- Set up variants as posEd's first (to distinguish variants by phase)  
- Can also list the different transcripts you should care about in the region of your variant (`evm37.relevant_transcripts(variant_of_interest)`)  
	- Includes introns and exons for a particular transcript (Introns represented as offsets +/- from the nearest exon, in a transcript)  


