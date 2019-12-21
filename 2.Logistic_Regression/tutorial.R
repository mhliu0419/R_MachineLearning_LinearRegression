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


# To fill the missing data for age based on Pclass

pl <- ggplot(df.train, aes(Pclass, Age))
pl
pl <- pl + geom_boxplot(aes(group = Pclass, fill = factor(Pclass) ,alpha = 0.4))
pl
pl + scale_y_continuous(breaks = seq(min(0), max(80), by = 2)) + theme_bw()


# Imputation of  age based on class

impute_age <- function(age,class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}


fixed.ages <- impute_age(df.train$Age, df.train$Pclass)


df.train$Age <- fixed.ages


missmap(df.train, main = 'Imputation Check', col = c('yellow', 'black'), legend = FALSE)


str(df.train)


# To remove some features/columns of data set

library(dplyr)


df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)
head(df.train)



# Train the model

log.model <- glm(Survived ~ . , family = binomial(link = 'logit'), data = df.train)
summary(log.model)













