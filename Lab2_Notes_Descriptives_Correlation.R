survey <- read.csv ("Lab2_survey_data.csv")
#opens the data file
View(survey)
#opens the view of the dataset
install.packages("psych")
#this is how to install a package
library(psych)
describe(survey$Open)
describe(survey)
#describe gives descriptive stats of the data
#can only do this with the psych package
plot(survey$Height,survey$HR)
#creates a scatter plot
plot(x = survey$Height,y = survey$HR)
#lines 7 and 8 are the same but the bottom one is nicer looking lol
plot(jitter(survey$Height),survey$HR)
#adding jitter which is a height component
#uncovers overlapping data points by adding a small amount of noise
install.packages("ggplot2")
#package to label scatterplot
library(ggplot2)
ggplot(data = survey,aes(x = Height,y = HR)) + geom_point() +
  labs(x ="Height", y ="Heart Rate", title ="Scatterplot of Heart Rate and Height")
#creates labels, plot, and scatter plot name
ggplot(survey, aes(x=Height,y = HR)) + geom_point() +
  geom_smooth(method = lm, se=FALSE) +
  labs(x = "Height", y = "Heart Rate",title = "Scatterplot of Heart Rate and Height")
#creates a line of best fit
cor(survey$Height, survey$HR)
#computes correlation coefficient of two values
cor.test(survey$Height,survey$HR)
