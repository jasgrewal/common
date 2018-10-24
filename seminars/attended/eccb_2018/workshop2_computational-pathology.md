[outline](http://eccb18.org/workshop-4/) and [detailed schedule](https://cpw.pathomation.com/program.html)  
[European digital images resource](http://idr.openmicroscopy.org/)   
	- Publishes reference image datasets (from published papers)  
[imageJ](https://engineering.leeds.ac.uk/staff/172/Derek_Magee)  
[NIH's open source image processing in Java, imageJ](https://imagej.nih.gov/ij/)  
	- ancient but has a large community around it.  
[Roche seems to have its qupath-like digpath viewer too?](https://rocheupath.com/)  
[HeteroGenius Medical Image Manager for image management and analysis](http://www.medicalimagemanager.com/)  

[THRIVE, Chakra's Tumour heterogeniety visualization tool](https://www.csb.pitt.edu/ith/)  
[MSK's slide viewer](slides.mskcc.org)  
[DeepVis, Visualizing deep NNs](https://github.com/yosinski/deep-visualization-toolbox)  

## Leeds' model  
[Derek Magee](https://engineering.leeds.ac.uk/staff/172/Derek_Magee)  
- [Darren Treanor, Leeds researcher for digital pathology](https://digitalpathologyassociation.org/darren-treanor)  
- 25,000 H&E slides/year; scanning since 2003  
	- >250,000 slides (viewable, but not downloadable)  
	- 8 Leica scanners  
	- [Hosted online](www.virtualpathology.leeds.ac.uk)  
- 4 consultant breast pathologists processing 8000 specimens via digital diagnosis  
	- peri-image scope style reporting lot slower, vs better interface speeds up reporting to same level as glass.  
	- Validation procedure conducted and published (Darren Treanor).  
	- Now scanning 300 slides per day (Breast and Neuro fully digital). Next step is to digitize all IHC.  
	- Have a dedicated staff member loading and scanning slides everyday.  

### Slower than glass  
- Initial interfaces lot slower than microscope (display size, quality, UI).  
	- Big screens (not on a laptop/tablet sized screen).  
	- Viewer than you get with the Roche scanner developed at Leeds.   
- How do pathology services run? WIthin the hospital or as a separate unit?  

In long term computers **may** completely replace pathologists, but atm we are augmenting pathologists to *save money* and produce *better outcomes*.  

### Simpler tasks first, can ease automated analysis  
Liver fat quantitation, stereology (collagen quantification using simple stain colour analysis).  
Alex Wright's work on global staining and appearance of local surrounding area.  

Normalization as part of the CNN; or another network that does normalization.  

Using cell detection and ID'ing to identify lymphocytes in lower GI cancers (TMAs), quantified TILs in H&E sections.  
	- 2 cores per case, 45 TMA blocks, 3 mm cores = 629 cases. Average observations for all cores in a patient.  
	- No plans for integration of genetics yet.  
	- TILs/mm2 predicts prognosis in surgery alone group; but not in surgery + chemo group.  

Alignment of images for 3D visualization (registration error)  
	- Approach [published here](https://ajp.amjpathol.org/article/S0002-9440(12)00168-X/fulltext)  
	- Divide image into overlapping patches and register individually
	- Align the patch positions across different images and combine into single non-rigid transform using a robust estimator.  
	- Do this at multiple scales (coarse to fine) and use previous scale to regularise current one.  

Does our scanner from Philips have an auto-focus normalization to account for folding tissue in scans and ensure certain areas are not blurry as a result?  

## Comp Path in tumour heterogeneity & cancer mets  
Chakra Chennubhotia (UPitts)  
Using cancer imaging data for  
- diagnosis/prognoses  
- disease biology  
- cancer image perception (where is this diversity in opinions about the same cancer coming?)  
	- [Using spatial context for identifying tissue structures and relationships](https://ieeexplore.ieee.org/document/7879863/)  
	- convert h&e into an angular space (Statistical color appearnace normalization for histological images, Nguyen L et al, in review) so you can then characterize types of noise too.   
- Statistical Color Appearance Normalization (SCAN)  
	- How did people try to evaluate their normalization methods in literature?  
		- renormalization / psychophysics / color physics / downstream tasks based  
Remember that color normalization is dependent on task. If you're using morphology, who cares about color; if you're using IHC then color is important.  
- HistoMapr to identify regions with important features (plasticity, nuclei patterns etc) and characterize the histology of different regions across a slide.  
	- Manual analysis > 3 minutes per slide, this pipeline 1.5 minutes.  
- TumorMapr using fluoresence data in a small cohort of ER/PR/HER2 samples.  
	- Identifying which cells 'co-exist' (you see an ER+ cell, are neighboring cells also ER+?). Building a profile for individual cells using this approach.  
	- What is the spatial configuration predicting recurrence based on patterns/layouts of cells (are there certain parts of the biopsy that are higher risk vs risk averse for recurrence).  
	- Can use this to identify which tissue areas to microdissect!! (ScoreG)  

## Computational pathology at scale - Thomas Fuchs  
Changing clinical practise one petabyte at a time.  
In other image datasets the object of interest is in the centre of the image, whereas in pathology, what we are interested in may be just a tiny spot in the slide somewhere.  
- Useful to learn ground truth and learn the mapping to H&E so you don't actually have to 'spend a slide' to generate h&e stained version.  
	- Possible to stain, take picture, wash, and repeat, but only 2-3 times.  
- Intra pathologist classification uncertainty of 20% (53/250 mismatches) just rotating 50 tumour images and showing to pathologists.  
- Easy to learn structured environment where rules were made by man (GO, chess)  
	- DARPAs robotics challenge (can't take 3 steps up stairs)  
- Dataset sizes have grown minimally  
	- Fuchs et al first paper in 2008 (1 slide), to CAMELYON16 (400 slides)  
	- Camelyon challenges can never generalize to clinical practise (micromets removed)  
- How can we train clinical-grade methods?  
	- 40,000 slides scanned / month at MSK  
	- 12,000 [prostate cancer slides](https://arxiv.org/pdf/1805.06983.pdf)  
- Flash storage with PURE, parallel load into DGX-1 cluster from flash storage (skipping disk IO time)  

Modalities of data: frozen, h&e, IHC, fluorescent, single cell, FNA. Tons of applications for each modality and corresponding cancer type.  

Generative Adversarial Networks for large-scale semantic image retrieval.  
	- Can optimize the GAN model with labeled data (finetune it)  
	- But even that doesn't tell you much and has same pitfalls as other models  

Multiple instance learning  
	- Weakly supervised learning by labelling slide in a binary fashion after NLP based info extraction from pathology report.  
	- Start out with the whole slide and soom in that if binary label says there is a cancer in there, it'll go find it, however tiny  
	- rank patches of images. Atleast 1 or more of these patches are positive if your overall image is positive. cross entropy loss calculated.  
	- Error high if training with 100-4000 samples; at >7000 iamges, you get models who learn by themselves (without any annotation) what prostate cancers look like per slide (5.8% error rate).  
	- Errors are colon cases (biopsy went through the pancreas to the colon instead)!  
Bayesian point processes?  


MInimal spanning trees & SOMs






