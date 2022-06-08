X <- c(1, 2, 0, 4, 3, 0, 2)
#screen time
Y <- c(6, 5, 7, 2, 1, 6, 5)
#sleep quality
plot(X,Y)
#set size for each subject
plot(Y)
#each subjects reaction time
cor(X,Y)
#correlation test on the Screen Time vs Sleep Quality
cor(Y,X)
#correlation test on Sleep Quality vs Screen Time
reg1 <- lm(Y~X)
#Y is being regressed on X NOT vice versa
summary(reg1)
sd(X)
sd(Y)
