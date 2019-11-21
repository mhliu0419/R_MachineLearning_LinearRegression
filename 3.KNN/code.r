# Get the Data: IRIS data set


## Use the ISLR libary to get the iris data set. Check the head of the iris Data Frame.

install.packages("ISLR")
install.packages("caTools")

library(ISLR)
library(caTools)

head(iris)
str(iris)

aaa <- iris




# Standardize Data

## Use scale() to standardize the feature columns of the iris dataset. 
## Set this standardized version of the data as a new variable.


standardized.iris.features <- scale(iris[,-5])



## Check that the scaling worked by checking the variance of one of the new columns.

var(standardized.iris.features[,1])



## Join the standardized data with the response/target/label column (the column with the species names.

standardized.iris <- cbind(standardized.iris.features, iris['Species'])
head(standardized.iris)





# Train and Test Splits


## Use the caTools library to split your standardized data into train and test sets. 
## Use a 70/30 split.

set.seed(101)

sample <- sample.split(standardized.iris$Species, SplitRatio = 0.7)

iris.train <- subset(standardized.iris, sample == TRUE)
iris.test <- subset(standardized.iris, sample == FALSE)

iris.train.species <- iris.train[5]
iris.test.species <- iris.test[5]




# Build a KNN model.


## Call the class library.

library(class)



## Use the knn function to predict Species of the test set. 
## Use k=1

species.prediction <- knn(iris.train[1:4], iris.test[1:4], iris.train$Species, k = 1)
species.prediction




## misclassification rate for knn with k = 1

missclass.rate = mean(species.prediction != iris.test$Species)
missclass.rate
