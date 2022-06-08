survey <- read.csv ("Lab2_survey_data.csv")
#read data into the data frame
View(survey)
install.packages("psych")
library(psych)
plot(survey$Under_Psychology,survey$Meaning)
#generate scatter plot 
plot(jitter(survey$Under_Psychology),survey$Meaning)
#generate scatter plot with jitter
install.packages("ggplot2")
library(ggplot2)
ggplot(data = survey, aes(x=Under_Psychology, y=Meaning)) + geom_point()+
  labs(x="Under_Psychology", y="Meaning", title = "Scatterplot of Under Psychology and Meaning")
#scatter plot with line of best fit
ggplot(survey, aes(x=Under_Psychology, y= Meaning)) + geom_point() +
  geom_smooth(method = lm, se=FALSE) +
  labs(x = "Under Psychology", y = "Meaning", title = "Scatterplot of Under Psychology and Meaning")
cor(survey$Under_Psychology, survey$Meaning)
cor.test(survey$Under_Psychology,survey$Meaning)
#correlation coefficient for Under_Psych and Meaning
describe(survey$Open)
describe(survey$Con)
describe(survey$Ext)
describe(survey$Agr)
describe(survey$Neu)
#descriptive statistics for each of the 5 personality traits
describe(survey)

#Answer the following questions:
#interpret the correlation results as they would appear in a results section:
#the correlation coefficient between Under_Psychology and Meaning is positive and is on the smaller side at 0.28
#the correlation between the two variables is significant but the strength of the relationship is low

#which of the five personality traits had the most variation in scores?
#measure of variation is in standard deviation the higher the sd the more variation there is
#Extroversion "Ext" has the most variation in scores  any of the other personality traits

#How do you know?
#you can tell this because its standard deviation is a lot higher than any of the other personality traits since it has a standard deviation of 0.94