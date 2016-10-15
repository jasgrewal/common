#Project 2 goals  
## Evaluate a bunch of parameter optimization tools  
- Response metric   
- Solution function is unknown  
	- Know min and max, scale of values (continuous or discrete?)  
	- Approach 1: Start halfway and try a point to the left and to the right, find next best, *exploitation*  
	- Approach 2: Try a bunch of random ranges, *exploration*  
	- Approach 3: Grid search  
- Current problem evaluation  
	- Human genome assembly  
	- Shotgun sequencing to contigs is ~24 hours  
	- Metric: Contiguity (how long the contigs are) and how accurate the contigs are ( 
		- We are optimizing for *contiguity*  
	- For genome assembly, there is one key parameter we can optimize, and then various other weaker ones.  
- **Paretto Frontier**   
	- Setting the boundaries for the metrics  
	
- Backend  
	- What types of input parameters (discrete with large/small ranges, continuous, binary)   
	- Make it portable to other commandline tools so optimizer can be told how to launch the tool  
	 
- Results output  
	- Generate metrics vs parameters plot  
	- Generate metrics vs metrics plot (Paretto Frontier)   

- Optimizers being evaluated  
	- paropts (wrapper around scikit-optimize)   
	- OPAL  
	- SpearMint  
	- R-packages  

