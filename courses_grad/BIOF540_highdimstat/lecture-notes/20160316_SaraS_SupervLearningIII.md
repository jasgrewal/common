#Model Selection
- Model selection addresses choice of model and how we set the parameters of the model  
	- ex., set k in KNN classifier, kernel in SVM, regularization parameter in penalized regression, degree of the polynomial in polynomial regression   
- Model complexity vs Prediction error
	- At one point your prediction error will go remarkably low (with training data) but at that point you'll probably be overfitting your model with a very complex model   

##Complexity regularization  
Say you've already fit your model, now want to limit the capacity for overfitting. You can do this with variable selection (feature selection) and variable penalization. Ex. early stopping in NN is a method of complexity regularization.  

###Cross Validation
In each CV cycle, you have 'k' runs. You can also repeat the 'k' partioning 'p' times. If you consider the error differences in subsequent partionionings, you can get a sense of standard CV error (typically, this is done ~100 times).

###Feature selection and penalization
- Our goal is to identify features/covariates that are important in predicting an outcome   
- But we usually have p >> n (millions of features, vs very few samples)  

####Linear Regression
- Looking at all genes together.   
- Depending on how you model your linear regression, it is possible that genes that show up as DE may have high coefficient value in supervised learning. But for ex., in case of highly correlated genes, supervised learning models might just identify 1/3rd of the gene factors as the important ones, and not the entire significantly correlated set.    
	- This is dependent on your regression parameters   

####Nested cross validation  
- Best way to go about feature selection when starting out in machine learning   
- Correlation between gene expression and outcome is a wrong approach  
	- Does not consider test data  

####Other approaches  
- Filter appraoch (above a mean threshold, for ex.)  
- Wrapper approach (wrap around feature selection in the context of training your whole model)  
	- Best subset regression : Each iteration new subset, choose subset that lets you make best possible prediction. **Generally unfeasible in omics study** when using 10000 features to identify k classes, you need to search a huge number of subsets of features.  
		- This assumes no prior knowledge of features. If you have, for ex., pathway information, you can group by pathways and subselect from those groups.  
	- Regularization has an inherent limit since your coefficient calculation is biased on training data so you end up either overfitting or underfitting by a certain amount  
		- Pruning algorithms fall under regularization, rather than backward stepwise regression.  
	- Regularized regression  
		- Penalization (tuning) parameter; penalize model so that it does not become overconfident.  
		- Lasso regression: easy to use, returns sparse solutions
			- No closed form solution: required numerical optimization
			- LARS, ADMM algorithms  
			- Limitation 1: Can never select more than N variables (N = number of individuals)  
			- **Elastic Net** combines L1 and L2 penalization functions to address the shortcoming of the lasso in the presence of correlated features.  
	- Forward/backward stepwise regression
		- Sequentially add best covariate that most improves the fit. Stop when addition of kth gene does not improve things anymore. In the forward, it does matter where you start, and you could end up in a local minima (use sensitivity analysis, come up with a consensus model) 
- Embedded approach - *most discussed* - modify objective function to identify a reduced feature set intrinsically (ex. regularization, penalization). This avoids overfitting by constraining the extend to which the model can fit the data.  

#Feature Selection  



