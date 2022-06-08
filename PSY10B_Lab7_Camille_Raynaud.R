install.packages("data.table")
library(data.table)
install.packages("effectsize")
library(effectsize)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
levels(all_data$Condition)<-c("Controls", "Reactivation+Tetris", "Tetris_only", "Reactivation_only")
descriptive_tab<- all_data %>%
  group_by (Condition) %>%
  summarise (means = 
               mean(Day_Zero_Number_of_Intrusions),
             SEs=sd(Day_Zero_Number_of_Intrusions)
             /
               sqrt(length(Day_Zero_Numbers_of_Intrusions)))
ggplot(descriptive_tab, aes(x=Condition, y=means))
+ geom_bar(stat="identity", aes(fill=Condition))+
  geom_errorbar(aes(ymin=means- SEs, ymax=means + SEs, width=0.1)) +
  ylab("Instrusive Thoughts (Mean of Week)")+
  xlab("")
#one factor ANOVA test
#H0 = number f intrusions split by the conditions are the same
#HA = number of intrusions split by the conditions are different
int_by_cond <7
aov(Day_Zero_Number_of_Intrusions-Condition,
    all_data)
summary(int_by_cond)
#no significance found of eta_squarrd so no computation needed

mean_sd<-all_data %/%
  group_by(Condition) %/%
  summarise(means=mean(Day_Zero_Number_of_Intrusions), 
            SDs=sd(Day_Zero_Number_of_Intrusions))\
#one factor ANOVA test with the conditions controls, reactivation+tetsis, 
#tetris only, and reactivation only being independent variables
#the dependent variable was the mean number of intrusive thoughts per week
#there was no significant main effect of Condition F(3, 68)=0.163, p=0.921
#the mean intrusive thoughts per week was not significantly different than oother conditions
#the control values M=3.56, SD=2.41
#Reactivation+Tetris M=3.11, SD=2.25
#Tetris only M=3.17, SD=1.58
#Reactivation only M=3.44, SD=1.58

