install.packages("ggplot2")

install.packages("ggthemes")

install.packages("dplyr")

install.packages("corrgram")

install.packages("corrplot")

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)



df <- read.csv('/Users/ml4274/Downloads/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine\ Learning\ with\ R/student-mat.csv', sep = ';')


num.cols <- sapply(df,is.numeric)

cor.data <- cor(df[,num.cols])
cor.data


### to plot two types of plots to show correlation in dataset for each variable pair

corrplot(cor.data, method = 'color')

corrgram(cor.data)

ggplot(df,aes(x=G3)) + geom_histogram(bins = 20, alpha = 0.5, fill = 'blue')



### use caTools package to split dataset to train set and test set

install.packages("caTools")
library(caTools)

set.seed(101)

sample <- sample.split(df$G3, SplitRatio = 0.7)
train <- subset(df, sample == TRUE)
test <- subset(df, sample == FALSE)


model <- lm(G3 ~ ., data = train)
summary(model)

# Residual is the difference between the actual value and the regression fitted line

# Coefficients
## Estimate is the slope for the coefficient
## Std. Error is the variability of the coefficient
## t-value measures whether this coefficient is meaningful for this model
## p-value is the probability of this coefficient is NOT relevent in this model

# R square value is the metric of valuing the goodness of fitting the model


# To call the residuals of the model
res <- residuals(model)
class(res)
res <- as.data.frame(res)
res

ggplot(res,aes(res)) + geom_histogram(fill = 'blue', alpha = 0.5)




# Prediction

G3.predictions <- predict(model, test)

results <- cbind(G3.predictions, test$G3)
colnames(results) <- c('predicted', 'actual')
results <- as.data.frame(results)
head(results)


# take care of negative scores
to_zero <- function(x) {
  if (x<0) {
    return(0)
  } else{
    return(x)
  }
}


results$predicted <- sapply(results$predicted, to_zero)


# MSE Mean Square Error

mse <- mean((results$actual - results$predicted)^2)

# SSE Sum of Squared Error

SSE <- sum((results$predicted - results$actual)^2)
SSE

# SST Sum of squared total

SST = sum((mean(df$G3) - results$actual)^2)

# R^2 = 1 - SSE/SST

R2 <- 1 - SSE/SST
R2
