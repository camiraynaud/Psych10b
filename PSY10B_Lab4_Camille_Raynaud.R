data<-read.csv("Lab4_raw_data.csv")
#data for this lab entered into code
View(data)
#this shows the data in a new tab
install.packages("tidyverse")
#this installs a bunch of packages such as dplyr for this lab
library(tidyverse)
install.packages("dplyr")
#packages for pipe operator and the select() function
library(dplyr)
install.packages("Rmisc")
#this package includes the CI() function for confidence intervals
library(Rmisc)
data$A1r<-6-data$A1
#this command tells R to reverse-code A1 into A1r
data%>%
  select(A1,A1r)%>%
  #represents what values we want to see so A1 and A1r
  head(15)
#shows the first 15 values
data$Agr<-rowMeans(
  #this makes a new variable by taking the mean score of Agr
  subset(data,
         #scores will come from the data frame called data 
         select=c(A1r,A2,A3)))
#data will come from items A1r,A2, and A3
head(data$Agr, 15)
#first 15 values of data$Agr
mean(data$Agr)
#computes the mean Agreeableness score 
#this value is 3.936
CI(data$Agr)
#computes confidence interval of 95% around the mean 
#this value is 3.78,4.08
#Based on this CI, can you reject the null hypothesis that μAgr = 3? 
#Yes the null hypothesis can be rejected
#Why or why not? Type your answer as a comment on your script.
#The sample confidence interval 3.78, 4.08 does not contain 3 so the null hypothesis is rejected
#the p value is less than the significance level