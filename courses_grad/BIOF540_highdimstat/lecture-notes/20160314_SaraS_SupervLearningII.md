#Supervised Learning II
##General framework
- loss function, global and local minima
	- Non convex/concave functions can give multiple local minima  
	- Wish to minimize the loss/cost function (alt. objective function)  
	
###Non negative least squares
- Estimate cell type proportions

###Other supervised classification methods
- KNNs are nonparametric since we don't have a general function where we pass a feature vector and generate a class.
	- Everytime we classify, we look at distances between test metric and all the examples we have
	- **1-NN**'s can still deal with >2 classes
		- combines classification of '1' (==K) nearest points to determine the classification of a point
		- Rather strict boundaries of classification in a 1-NN; decision boundaries for larger K will usually be smoother, but determine K using **cross-validation**   

- SVMs
	- Define the decision boundary by maximing classificaiton *margin*
	- SVM kernel trick (make linear model work in non-linear space)  
		- I/O relationships may not be linear
	- Works well when you have a high number of training data  

- ?When do you know which approach to use to prevent overfitting?
	- Architecture dependent, empirical
	- Spend long enough in data mining and ML, get a feel for what is the right thing to do
	- Early stopping is the way to go for many neural networks becaues it has been demonstrated to work, for example.  

- Complexity of decision boundary  

##Cross validation
- 4 fold CV
	- following table:
input_combination | test | loss measures
--- | --- | ---  
1,2,3 -> M1 | 4 | l1
1,2,4 -> M2 | 3 | l2
1,3,4 -> M3 | 2 | l3
2,3,4 -> M4 | 1 | l4  

- Leave one out CV  
	- This is not good in genomics, tend to overfit  

- 3 fold CV 
	- only consideration is sometimes we want to use as many training examples as we can, so using limited # examples to train may not be good enough  

- ?Any case for repurposing training data  
	- yes, when classificaiton is aimed to be relaxed fit, this can be a good idea to increase discrimination between classes.  

