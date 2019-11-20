# Bike Sharing Demand Kaggle challenge

# datetime - hourly date + timestamp
# season - 1 = spring, 2 = summer, 3 = fall, 4 = winter
# holiday - whether the day is considered a holiday
# workingday - whether the day is neither a weekend nor holiday
# weather -
#  1: Clear, Few clouds, Partly cloudy, Partly cloudy
#  2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
#  3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
#  4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
# temp - temperature in Celsius
# atemp - "feels like" temperature in Celsius
# humidity - relative humidity
# windspeed - wind speed
# casual - number of non-registered user rentals initiated
# registered - number of registered user rentals initiated
# count - number of total rentals


df <- read.csv('/Users/ml4274/Downloads/R_MachineLearning_LinearRegression-master/bikeshare.csv')
class(df)

head(df)

install.packages("ggplot2")
install.packages("ggthemes")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
library(ggthemes)

theme_set(theme_economist_white())



# Create a scatter plot of count vs temp. Set a good alpha value.


ggplot(df, aes(temp, count, color = temp)) + geom_point(alpha = 0.5) + 
  ggtitle('Bike Count vs Temp')




# Plot count versus datetime as a scatterplot with a color gradient based on temperature. You'll need to convert the datetime column into POSIXct before plotting.

df$datetime <- as.POSIXct(df$datetime)

ggplot(df, aes(datetime, count)) + geom_point(alpha = 0.3, aes(color = temp)) +
  scale_color_continuous(low = 'green',high = 'red') + 
  ggtitle('Bike Count vs Datetime, with color gradient based on Temp')


# The correlation between temp and count



cor(df[,c('temp','count')])



# Season data: Create a boxplot, with the y axis indicating count and the x axis begin a box for each season.



ggplot(df,aes(x=factor(season),y=count, color = factor(season))) + geom_boxplot() +
  labs(x = 'Seasons: Spring, Summer, Fall, Winter', y = 'Bike Count')

# The boxplot indicates the most popular seasons are summer and fall
# But count in spring is lower than the count in winter, it's strange
# Probably that's due to the increase in total count available


# Create an "hour" column that takes the hour from the datetime column.


hour <- format(df$datetime, '%H')

df <- cbind(df, hour)

head(df)

# Alternative way:
# df$hour <- sapply(df$datetime, function(x){format(x,"%H)})

# Now create a scatterplot of count versus hour, with color scale based on temp. Only use bike data where workingday==1.


ggplot(df[df$workingday == 1,], aes(x=hour,y=count,color = temp)) + 
  geom_point(position=position_jitter(w=1, h=0),alpha = 0.5) + 
  scale_color_gradientn(colors=c('dark blue','blue','light blue','green','yellow','orange','red'))

# OR use: filter(df,workingday==1)
# position_jitter can fill the space and make points our of their original space
# scale_color_gradientn can let us choose colors as different level


ggplot(filter(df, workingday == 0), aes(x=hour,y=count,color = temp)) + 
  geom_point(position=position_jitter(w=1, h=0),alpha = 0.5) + 
  scale_color_gradientn(colors=c('dark blue','blue','light blue','green','yellow','orange','red'))


## Notice that working days have peak activity during the morning (~8am) and right after work gets out (~5pm), with some lunchtime activity. While the non-work days have a steady rise and fall for the afternoon














# Building the model



temp.model <- lm(count ~ temp, data = df)

summary(temp.model)




# How many bike rentals would we predict if the temperature was 25 degrees Celsius?


df$hour <- sapply(df$hour, as.numeric)


model <- lm(formula = count ~ . - casual - registered - datetime - atemp, 
            data = df)

summary(model)





