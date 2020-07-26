install.packages("rpart")
library(rpart)
help("rpart")
## rpart allows to create Recursive Partitioning and Regression Trees

## load data
str(kyphosis)
summary(kyphosis)


## build a tree model

tree <- rpart(Kyphosis ~ ., method = 'class', data = kyphosis)

## display cp table
printcp(tree)

## plot decision tree
plot(tree, uniform = T, main = 'Kyphosis Tree')

## label the decision tree plot
text(tree, use.n = T, all = T)

