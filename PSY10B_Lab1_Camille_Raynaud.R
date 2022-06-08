Age <- read.csv("Lab1_demo.csv")
#this puts the csv file into the working directory so it can be used in the data frame
#this denotes a note not a line of code
View(Age)
#opens the data frame in a new window via view function
hist(Age$HR)
#the line above creates a histogram with the data from demo w/heart rate and age
mean(Age$HR)
#this calculates the mean/average heart rate for all ages
#average is about 73.0
avg_HR <- mean(Age$HR)
#average value for the mean heart rate assigned to variable of avg_HR
#average is about 73.0 beats per minute for all ages
