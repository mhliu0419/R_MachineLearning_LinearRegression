# Logistic Regression Project



# Get the Data

adult <- read.csv('/Users/AncelotLiu/Desktop/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training\ Exercises/Machine\ Learning\ Projects/CSV\ files\ for\ ML\ Projects/adult_sal.csv')

head(adult)

library(dplyr)
adult <- select(adult, -X)

head(adult)
str(adult)
summary(adult)



# Data Cleaning
