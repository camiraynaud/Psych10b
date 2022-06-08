install.packages("data.table")
library(data.table)
install.packages("effectsize")
library(effectsize)
install.packages("dplyr")
library(dplyr)
all_data <- fread("https://raw.githubusercontent.com/CrumpLab/statisticsLab/master/data/MehrSongSpelke2016.csv")
View(all_data)
exp1_data <- all_data %>% filter(exp1==1)
#set up of package and data from experiment 1
difference_scores <- test_phase-baseline
#Q:run a one-sample t-test using the difference scores to test the hypothesis that the portion 
#of babies time spent looking at the singer of the familiar song will be greater during the test phase 
#then at baseline
sd(difference_scores)
t.test(difference_scores, mu= 0)
#reject the null hypothesis because 0 does not fall in between the values in the CI [0.011, 0.133]
#familiar song wasn't greater during the test phase
cohens_d(difference_scores, mu= 0)
#this is how to calculate the significant effect size
#there was a significant effect
#effect size was d= 0.43 which is a medium effect
#write up the one-sample t-test results:
#(M= 0.072, SD= 0.169, 95% CI= [0.011, 0.133]), t(31)= 2.42, p= 0.022, d= 0.43 (one-sample t-test))
#The proportion of time that they looked toward the person who sang the familiar song differed greater than chance
#check your work by comparing with the mean, t-value, and effect size from the paired samples t-test 
t.test(test_phase, baseline, paired= TRUE)
cohens_d(test_phase, baseline, paired=TRUE)
#(M= 0.072, SD= 0.169, 95% CI= [0.011, 0.133]), t(31)= 2.42, p= 0.022, d= 0.43 (paired t-test))
#The proportion of time that they looked toward the person who sang the familiar song differed greater than chance
#these results are the same





qt(0.05/2, 2)
