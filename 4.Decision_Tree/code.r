# Get the Data

## Call the ISLR library and check the head of College (a built-in data frame with ISLR, use data() to check this.) Then reassign College to a dataframe called df
library(ISLR)
df <- College
head(df)


# EDA

## Create a scatterplot of Grad.Rate versus Room.Board, colored by the Private column.

library(ggplot2)

ggplot(data = df, aes(x = Room.Board, y = Grad.Rate)) + geom_point(aes(color = Private))

## Create a histogram of full time undergrad students, color by Private.


ggplot(data = df, aes(x = F.Undergrad)) + geom_histogram(color = 'black', aes(fill = Private))

## Create a histogram of Grad.Rate colored by Private. You should see something odd here.


ggplot(data = df, aes(x = Grad.Rate)) + geom_histogram(color = 'black', aes(fill = Private), bins = 50)


## What college had a Graduation Rate of above 100% ?
library(dplyr)

filter(df,df[,'Grad.Rate'] > 100)
subset(df, Grad.Rate > 100)

## Change that college's grad rate to 100%

df[row.names(filter(df,df[,'Grad.Rate'] > 100)),'Grad.Rate'] <- 100
