# #clear the console
cat("\f")
# 
# The Sparks Foundation || GRIP_APRIL-21
# Data Science and Business Analytics
# TASK 2 - Prediction using Unsupervised ML
# # date:9/4/21
# # Author : EBENEZER M
# 
# 
# 
# To Predict the optimum number of clusters from the 'Iris' data set and to represent it visually.

# Steps involved
# Importing Libraries
# Load the Dataset
# Explore the iris dataset

# Plot the data as Pair Plot
# Plotting  data using correlogram
# Using K-means Clustering Algorithm
# Visualizating the clusters & plot centroids

# set the working directory
setwd("E:/sparkfoundation")

#import the dataset 
md=read.csv("iris.csv")

# convert the csv file format into data_frame format
md=as.data.frame(md)
md$Species=NULL
md$Id=NULL
# view the data set
head(md)
# structure of the data set
str(md)
# summary of the data set
summary(md)
#checking for Missing Values
print(any(is.na(md)))

pairs(md)

library(corrgram)
corrgram(md, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Correlogram ")

# Elbow method
library(ggplot2)
library(factoextra)
fviz_nbclust(md, kmeans, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "Elbow method")

# Silhouette method
fviz_nbclust(md, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method")

# Gap statistic
# nboot = 50 to keep the function speedy. 
# recommended value: nboot= 500 for your analysis.
# Use verbose = FALSE to hide computing progression.
set.seed(123)
fviz_nbclust(md, kmeans, nstart = 25,  method = "gap_stat", nboot = 50)+
  labs(subtitle = "Gap statistic method")