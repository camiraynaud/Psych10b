data<-read.csv("Lab4_raw_data.csv")
#data for this lab entered into code
View(data)
install.packages("dplyr")
#packages for pipe operator and the select() function
install.packages("Rmisc")
#this package includes the CI() function for confidence intervals
library(dplyr)
library(Rmisc)
#library commands I forgot what this does lmao
data$E3r<-6-data$E3
#this command tells R to reverse-code E3 into E3r
data%>%
  #pipe operator to tie commnads together in our data frame
  select(E3,E3r)%>%
  #represents what values we want to see so E3 and E3r
  head(15)
  #shows the first 15 values
install.packages("tidyverse")
library(tidyverse)
data$Ext<-rowMeans(
  #this makes a new variable by taking the mean score
  subset(data,
         #scores will come from the data frame called data 
         select=c(E1,E2,E3r))
  #data will come from items E1,E2, and E3
)
head(data$Ext, 15)
#first 15 values of data$Ext
mean(data$Ext)
#computes the mean Extraversion score
CI(data$Ext)
#computes confidence interval of 95% around the mean 
#this value is 3.07, 3.45
