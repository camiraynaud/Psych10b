X <- c(2,2,2,2,2,4,4,4,4,4,6,6,6,6,6)
#set size (1,3,5, or 7 letters in the memory set)
Y <- c(430, 480, 480, 500, 500, 530, 550, 560, 590, 600, 620, 620, 660, 700, 710)
#reaction time variable in ms
#creating variables with the data added in Sternberg Memory Task with a between subjects design

plot(X)
#set size for each subject
plot(Y)
#each subjects reaction time
cor(X,Y)
#correlation test on the Set Size vs Reaction Time
cor(Y,X)
#correlations a

reg1 <- lm(Y~X)
#this calculates the linear regression for reaction time and set size
summary(reg1)
#this shows the summary of the data for the linear regression analysis

#Linear Regression Analysis Summary:
#A linear regression analysis was conducted, with Set Size as the predictor variable 
#and Reaction Time as the outcome variable. There was a significant relationship 
#between Set Size and Reaction Time, F(1, 13) = 78.97, p < .001, such that Reaction Time increased
#by 46ms for every one-letter increase in Set Size

set2 <- c(480, 530, 500, 430, 550)
set4 <- c(500, 600, 560, 620, 480)
set6 <- c(620, 590, 700, 660, 710)
#defining all the sets of reaction times

t.test(set2, set6, var.equal=TRUE, alternative="greater")
#one-tailed independent samples t-test between size 2 and 6
#right tailed test so it is "greater" in the alternative hypothesis