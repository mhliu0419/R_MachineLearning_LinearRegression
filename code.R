library(ggplot2)
library(ggthemes)
library(dplyr)


df


num.cols <- sapply(df,is.numeric)

cor.data <- cor(df[,num.cols])
cor.data

install.packages("corrgram")
library(corrgram)
install.packages("corrplot")
library(corrplot)


corrplot(cor.data, method = 'color')


corrgram(cor.data)

ggplot(df,aes(x=G3)) + geom_histogram(bins = 20, alpha = 0.5, fill = 'blue')





install.packages("caTools")
library(caTools)

set.seed(101)

sample <- sample.split(df$G3, SplitRatio = 0.7)
train <- subset(df, sample == TRUE)
test <- subset(df, sample == FALSE)
