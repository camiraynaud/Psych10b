install.packages("data.table")
library(data.table)
install.packages("effectsize")
library(effectsize)
install.packages("dplyr")
library(dplyr)

Font <- as.factor(c(1, 1, 1, 2, 2, 2, 3, 3, 3))
Speed <- c(60, 94, 80, 90, 140, 100, 130, 200, 150)
aovdata <- data.frame(Speed, Font)

levels(aovdata$Font)<- c("Arial", "Lexic", "LexPro")

Arial <- c(1,1,1)
Lexic <- c(2,2,2)
LexPro <- c(3,3,3)
#levels of fonts

aov(Speed~Font, aovdata)
summary(speed_by_font)
eta_squared(speed_by_font)



