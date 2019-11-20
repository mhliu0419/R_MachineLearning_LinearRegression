# KNN

# Pros:
#   Simple. Training is trivial. Works with any number of Classes
#   Easy to add more data. Few parameters: K, Distance Metric

# Cons:
#   High prediction cost(worse for large data sets)
#   Not good with high dimensional data
#   Categorial fectures don't work well


# ISLR: Data for an Introduction to Statistical Learning with Applications in R
install.packages("ISLR")
library(ISLR)
str(Caravan)

summary(Caravan$Purchase)



# to check whether we have to clean data

any(is.na(Caravan))


var(Caravan[,1])
var(Caravan[,2])

purchase <- Caravan[,86]

# scale all columns but 86th
standardized.Caravan <- scale(Caravan[,-86])

var(standardized.Caravan[,1])
var(standardized.Caravan[,2])

# Train Test Split
test.index <- 1:1000
test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]


#
#
#
#


# Build KNN model

# class library contains KNN functions
library(class)
set.seed(101)

# knn(training data without label, test data without label, training data label points, k = ) 
predict.purchase <- knn(train.data, test.data, train.purchase,k=1)

misclass.error <- mean(test.purchase != predict.purchase)
misclass.error



#
# Choosing a k value

predict.purchase <- NULL
error.rate <- NULL

for (i in 1:20){
  set.seed(101)
  predict.purchase <- knn(train.data, test.data, train.purchase,k=i)
  error.rate[i] <- mean(test.purchase != predict.purchase)
}

print(error.rate)

#
# Visualize K elbow method
#

install.packages("ggplot2")
library(ggplot2)

k.values <- 1:20
error.df <- data.frame(error.rate, k.values)

error.df

ggplot(error.df,aes(k.values,y=error.rate)) + 
  geom_point() + 
  geom_line(lty = 'dotted', color = 'red') 


# so k = 9 is optimal
