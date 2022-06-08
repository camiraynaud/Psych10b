#Research scenario: you want to see if people remember words better when they are presented more 
#slowly. You design a repeated measures experiment, in which three participants each play a memory 
#game in three different modes: Slow, Medium, and Fast.
Subject <- as.factor(c(1, 2, 3, 1, 2 ,3, 1, 2, 3))  # List our subject numbers, store as a factor (important!)
Mode <- as.factor(c(1, 1, 1, 2, 2, 2, 3, 3, 3))  # List the conditions for our IV, store as a factor (important!)
levels(Mode) <- c("Slow", "Medium", "Fast")  # Name the levels of our IV factor (1=Slow,2=Med,3=Fast)
Points <- c(25, 30, 45, 15, 20, 25, 5, 10, 15)  # List our observations (DV = points scored in memory game)
aovdata <- data.frame(Points, Mode, Subject)   # Store these variables within a data frame, aovdata

#1.	Enter the R commands that you would use to (1) conduct the appropriate ANOVA and store its results,
#and (2) display the ANOVA summary table.
install.packages("data.table")
library(data.table)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("effectsize")
library(effectsize)
#packages

Subject <- as.factor(c(1, 2, 3, 1, 2 ,3, 1, 2, 3)) 
#List our subject numbers, store as a factor (important!)
Mode <- as.factor(c(1, 1, 1, 2, 2, 2, 3, 3, 3))  
#List the conditions for our IV, store as a factor (important!)
levels(Mode) <- c("Slow", "Medium", "Fast")
#Name the levels of our IV factor (1=Slow,2=Med,3=Fast)
Points <- c(25, 30, 45, 15, 20, 25, 5, 10, 15)
#List our observations (DV = points scored in memory game)
aovdata<-data.frame(Points,Mode,Subject)
#points_Per_Mode=aov(Points~Mode+error(Subject/Mode), aovdata)
Mode = aov(Points ~ Mode + Error(Subject/Mode), Mode)
summary(Mode)

#2.	Run these commands and paste the ANOVA summary table below (either text or screenshot)
#3.	Enter the R command that you would use to compute effect size (include commands to load any necessary packages)
install.packages("effectsize")
library(effectsize)
cohens_d(Points ~ Mode, paired=TRUE, data=Fast_Slow_df)
#4.	Enter the R commands that you would use to compute a post hoc t-test comparing 
#Fast vs. Slow modes. (Notes: See Lab 8 for steps, including filtering. Include commands to load any 
#necessary packages. Since we are only running one post hoc test in this example, we will not 
#correct the p-value for this exercise. 
#If you get an error with the cohens_d(), command, try entering “data=” before the name of your 
#dataset, e.g. “data=aovdata” as your last input.)
install.packages("dplyr")
library(dplyr)
Fast_Slow_df <- aovdata %>%
  filter(Mode == "Fast" | Mode == "Slow")
t.test(Points ~ Mode, paired = TRUE, data=Fast_Slow_df)
eta_squared(Mode)
mean_sd_tab <- aovdata %>%
  group_by(Mode) %>%
  summarize(means=mean(Points), SDs=sd(Points))
mean_sd_tab
#5.	Run this post hoc test in R, then write up the results of the ANOVA and post hoc test. 
#(You can ignore the third group for this example. See Labs 7 and 8 for how to get group means and SDs.)

