################
##SETUP
################
##First let us get the ggplot library, 'ggplot2'
##If you don't have ggplot2 installed, get it like so:
install.packages("ggplot2")
##And then load it into your current environment,
library(ggplot2)

################
##Getting started - overview
################
## GET DATA  
### We will be working with one of the example datasets available within the ggplot2 library  
data("msleep", package = "ggplot2")
### This dataset contains statistics on sleep patterns for certain mammals  
head(msleep)  

## PLOT DATA! 
ggplot() #This initializes the plot structure. Then we add to it
#There are 3 *essential* components of a plot, in ggplot  
##1. The particular dataset that we wish to plot data from  
ggplot(msleep) 
##2. The aesthetics, defining the things from the data you wish to plot, and what parts of the graph they go on to. In this instance, we are defining the variables from our dataset, that map to the x and y coordinates. 
ggplot(msleep, aes(x=name, y=sleep_total)) 
##3. The geometric object, also called the 'geom'. This can be a geom_point(), geom_count(), geom_line() etc. It specifies *how* your data is presented on the plot  
## We add this attribute using the '+' sign. You can tack on as many of these as you want, as long as they work within the bounds of the different variables you have defined  
ggplot(msleep, aes(x=name, y=sleep_total))  + geom_point() + geom_line() + geom_bar(aes(x = vore))

#Every plot attribute can be added on

################
##Some basic plots with ggplot2
################

################
##Additional notes 
################
# CHANGE THEMES
## Instead of always adding your theme of choice to the end of your ggplot command, you can change the default theme with the following command  
theme_set(theme_bw())

# You can also install other helpful packages for data science in R (including ggplot2), with the following command:
install.packages("tidyverse")
## Look up www.tidyverse.org for more details!