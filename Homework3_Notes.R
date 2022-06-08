install.packages("tidyverse")
#this installs a bunch of packages such as dplyr for this lab
library(tidyverse)
install.packages("dplyr")
#packages for pipe operator and the select() function
library(dplyr)
install.packages("Rmisc")
#this package includes the CI() function for confidence intervals
library(Rmisc)
mean(chocolates$cacao)
#mean for calculation
CI(chocolates$cacao)
#this represents the 95% confidence interval for a 
#variable called cacao in a data fram called chocolates


library(prob)
tab <- table(data$coin)
dbinom(6,12,0.5)
#this calculates the probability of getting exactly 6 heads on 12 
#total flips and with a 0.5 probability of success
#the probability for getting exactly 6 out of 12 heads is (blank)
pbinom(3,18,0.5)
#probability of 3 or fewer heads out of 18 coin tosses is (blank)
