
# Logistic Regression Learning
# Titanic Data Set
# To predict the survival on the Titanic

# Read Data

df.train <- read.csv('/Users/AncelotLiu/Desktop/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine\ Learning\ with\ R/titanic_train.csv')
print(head(df.train))
str(df.train)

df.test <- read.csv('/Users/AncelotLiu/Desktop/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine\ Learning\ with\ R/titanic_test.csv')


# A package helps to explore and visualize how many data are missing/ NA

library(Amelia)

missmap(df.train, main = 'Missing Map', col = c('yellow', 'black'), legend = FALSE)


library(ggplot2)

ggplot(df.train, aes(Survived)) + geom_bar()

ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill = factor(Pclass)))

ggplot(df.train, aes(Sex)) + geom_bar(aes(fill = factor(Sex)))

ggplot(df.train, aes(Age)) + geom_histogram(bins = 20, alpha = 0.5, fill = 'blue')

ggplot(df.train, aes(SibSp)) + geom_bar()

ggplot(df.train, aes(Fare)) + geom_histogram(bins = 20, alpha = 0.5, fill = 'green', color = 'black')





