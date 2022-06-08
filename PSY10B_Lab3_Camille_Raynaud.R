data<-read.csv("Lab3_probability_data.csv")
#this adds the data into a  frame in the work directory
View(data)
install.packages("sjmisc")
library(sjmisc)
#this brings up the data from the csv file in a new tab
set.seed(15)
#this is a place setter for the random number generator
#this creates a generation of a random number starting at 15
rbinom(20,18,0.5)
#this code creates a random distribution with 20 coin flips, 18 flips per sample, and a probability of 50% chance for each coin flip
frq(data$coin)
dbinom(12,18,0.5)
#this calculates the probability of getting exactly 12 heads on 18 total flips and with a 0.5 probability of success
#the probability for getting exactly 12 heads is 7.08%
pbinom(12,18,0.5)
#this calculates the probability of getting at most 12 heads
#the probability is 95.1%
1-pbinom(12,18,0.5)
#this calculates the probability of getting at least 12 heads 
#the probability of getting at least 12 heads is 4.8%