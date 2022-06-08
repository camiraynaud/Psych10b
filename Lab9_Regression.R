#no packages needed for this lab :)
X <- c(1,1,1,1,1,3,3,3,3,3,5,5,5,5,5,7,7,7,7,7)
#set size (1,3,5, or 7 letters in the memory set)
Y <- c(433,435,434,441,457,519,511,513,520,537,598,584,606, 605,607, 666,674,683,685,692)
#reaction time variable in ms
#creating variables with the data added in
plot(X)
#set size for each subject
plot(Y)
#each subjects reaction time
cor(X,Y)
#correlation test on the Set Size vs Reaction Time
cor(Y,X)
#correlations are symmetrical so this will work too
reg1 <- lm(Y~X)
#Y is being regressed on X NOT vice versa
summary(reg1)
#summary table for reg1 results
#see pdf for writing up linear regression results
#Example:
#“A linear regression analysis was conducted, with Set 
#Size as the predictor variable and Reaction Time as the
#outcome variable. There was a significant relationship 
#between Set Size and Reaction Time, F(1, 18) = 1800,
#p < .001, such that Reaction Time increased by 40ms for
#every one-letter increase in Set Size"
plot(X,Y)
plot(X,Y, xlab="Set Size (letters)", ylab= "Reaction Time (ms)", 
     main="Reaction Time as a Function of Set Size")
abline(reg1)
#line of best fit using this function on the linear regression analysis lm()
set5 <- c(598, 584, 606, 605, 607)
#5 letter set data
set3 <- c(519, 511, 513, 520, 537)
#7 letter set data
t.test(set5, set3, var.equal=TRUE)
t.test(set5, set3, var.equal=TRUE, alternative="greater")
#alternative is the alternative hypothesis opposed to the null hypothesis