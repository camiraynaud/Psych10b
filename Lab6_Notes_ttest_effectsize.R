install.packages("data.table")
library(data.table)
#fread() function for importing online data
install.packages("effectsize")
library(effectsize)
#cohens_d() function for computing t-test effect size
install.packages("dplyr")
library(dplyr)
#pipe operator (%>%) to combine commands
#also includes the filter() function to select a subset of the dataset
all_data <- fread("https://raw.githubusercontent.com/CrumpLab/statisticsLab/master/data/MehrSongSpelke2016.csv")
View(all_data)
#shows the data from github website
install.packages("pacman")
library(pacman)
p_load(data.table,effectsize,dplyr,curl)
#can put any packages in this to load it
#checks if youve installed a package or not
exp1_data <- all_data %>% filter(exp1==1)
#this filters out just the data from experiment 1
#"==" is a logical operator that means "is equal to"
#are the babies biased to look at one person or the other before they sing?
#null hypothesis is mean=0.5
baseline <- exp1_data$Baseline_Proportion_Gaze_to_Singer
plot(baseline)
#plots the baseline against the index so basically values on y axis and participant number on x-axis
#average roughly looks like its 0.5 since numbers are mostly between 0 and 1
hist(baseline)
#histogram for the data to verify the scatterplot info
#better for catching errors
mean(baseline)
#compute the mean for baseline
#value of mean is 0.521
sd(baseline)
#compute the standard deviation for the baseline
#value of sd is 0.177
#based on the sd do you expect that our mean is significantly different from 0.5?
t.test(baseline, mu=0.5)
#this computes a t-test 
#need to type mu before your mean or R will try to run a two sample t-test
#Output of t-test is as follows:
#data:  baseline
#t = 0.67438, df = 31, p-value = 0.5051
#alternative hypothesis: true mean is not equal to 0.5
#95 percent confidence interval:
#  0.4572940 0.5848994
#sample estimates:
#  mean of x 
#0.5210967 
#what does this output tell us?
#our t-value isnt very extreme as its less than 1
#our degrees of freedom is 31-1 (n-1) n=31
#our p-value is 0.50
#do we reject the null hypothesis? does the confidence interval agree?
#Writing up a one-sample t-test steps
#describe the results 
#report descriptive stats in parentheses (mean, SD)
#can also report 95 CI as well 
#example stats: (M=0.521, SD=0.177, 95% CI= [0.457,0.585])
#then report test values ex: t(31)=0.67, p=0.51 (one-sample t-test)
#is there a preference between baseline and the test phase?
#null hypothesis is mean=0.5
test_phase <- exp1_data$Test_Proportion_Gaze_to_Singer
plot(test_phase)
hist(test_phase)
sd(test_phase)
t.test(test_phase, mu=0.5)
#what does the output tell us
#that each infant looked at each face evenly across the board
#can see this from our t-value
#(M=0.593, SD=0.179, 95% CI= [0.529, 0.658]) 
#t(31)= 2.96, p= 0.006, d=0.52 (one-sample t-test)
#reported Cohen's d which is the measure of effect size if there is a significant effect
cohens_d(test_phase, mu=0.5)
#Cohen's d calculation is the same; d=0.52
#paired samples t-tests
#compares one group mean with another group mean (different than one-sample t-test)
#scores need to come from the same person ex: baby 1 baseline and test phase data
#t.test(variable 1, variable 2, paired=TRUE)
#paired=TRUE runs the paired test
t.test(test_phase, baseline, paired=TRUE)
#no mu here
#output of paired test is as follows:
#data:  test_phase and baseline
#t = 2.4164, df = 31, p-value = 0.02175
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  0.01129217 0.13349698
#sample estimates:
#  mean of the differences 
#0.07239458 
#What does this tell us?
#our t-value is big, our df is 31 (this is n-1), or p-value is 0.02
#do we refect null hypothesis?
cohens_d(test_phase, baseline, paired=TRUE)
#effect size ran because the effect is significant (p<0.05)
#the effect size is 0.43
#only difference in the write up is (paired t-test) instead of single
difference_scores <- test_phase - baseline
#this last line wont run!!!
#baseline subtracted from test phase to get the difference in the variables

