# Load data

library(ISLR)
head(iris)


# Install package of SVM

#install.packages('e1071')
library(e1071)
help("svm")

# Create a SVM model

model <- svm(Species ~ ., data = iris)
summary(model)

# Predict/Classify with SVM model

pred.values <- predict(model, iris[1:4])
table(pred.values, iris$Species)
