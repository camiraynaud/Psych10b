data<-read.csv("Lab3_probability_data.csv")
View(data)
install.packages("sjmisc")
#package for pipe operator and frequencies/proportions
library(sjmisc)
#library command 
tab<-table(data$coin)
#frequency for table of different coin flips
#this creates the table but doesnt run it
tab
#this runs the table
#1 is heads and 2 is tails
#frequency of head is 12 and the frequency of tails is 6
barplot(tab)
#this creates a bar graph with our outcomes
prop.table(tab)
#this computes a proportion from the table data
prop.table(tab)%>%
  #pipe operator lets you string commands together this is from the sjmisc package
  #this makes the propotions smaller
  round(3)
#can also write as round(prop.table(tab),3)
#also prop.table(tab)%>%round(3)
#these all display the same functions
#this rounds to 3 decimal places
frq(data$coin)
#this is just creating a nicer table with mean, sd, etc.
#total N=18 valid N=18 mean=1.33 sd=0.49
dbinom(12,18,0.5)
#this gives us the probability of getting exactly some number of successes
#specifically here its 12 heads out of 18 flips
#the probability is 7.08% chance
#pbinom(x,N,p) gives us the probability of getting x or in this case, fewer heads
pbinom(6,18,0.5)
#probability of 6 or fewer tails is 11.8% which is more of a chance than 12 or more heads
pbinom(11,18,0.5)
#probability of 11 or fewer heads which is 88.1%
1-pbinom(11,18,0.5)
#probability of 12 or more heads which is 11.89%
rbinom(1,18,0.5)
#randomly generating more flips
#set.seed() can be used to make the number more random
#rbinom(x,n,p)
#x is the number of samples to draw
#n is the number of flips per sample
#p is the probability of "success"
#this code randomly generates a sample of 18 coin flips
set.seed(222)
rbinom(10,18,0.5)
hist(rbinom(10000,18,0.5))
#made a histogram of all the data points