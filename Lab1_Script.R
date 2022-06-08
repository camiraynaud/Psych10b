cereals <- read.csv("Lab1_cereals.csv")
#this denotes a note not a line of code
View(cereals)
hist(cereals$sugars)
#the line above creates a histogram with the data from lab 1 cereals and lab 1 demo
hist(cereals$sugars)
#this is a histogram for cereals and sugars
hist(cereals$calories)
#this is a histogram for cereals and calories
hist(cereals$rating)
#this is a histogram for cereals and cereal ratings
mean(cereals$sugars)
#this calculates the mean for sugar in the group of cereals
#average is about 6.922
avg_sugars <- mean(cereals$sugars)
#average value for the mean of cereals and sugars
#average is about 6.9
avg_calories <- mean(ceareals$calories)
#average value for the mean of the cereals calories
#average is about 106.8
avg_rating <- mean(cereals$rating)
#average value for the mean of the cereal ratings
#average is about 42.67
