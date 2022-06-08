install.packages("data.table")
library(data.table)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("effectsize")
library(effectsize)
#packages

rm_data <- fread("Lab8_typing_data.csv")
View(rm_data)
#data for this lab

rt_by_stimulus=aov(mean_rt~Stimulus+Error(Subject/Stimulus), rm_data)
summary(rt_by_stimulus)
normal_bigrams_df <- rm_data %>%
  filter(Stimulus == "Normal" | Stimulus == "Bigrams")
#Normal vs Bigrams test
#code is creating a data frame between Normal and Bigrams

bigrams_random_df <- rm_data %>%
  filter(Stimulus == "Bigrams" | Stimulus == "Random")
#Bigrams vs Random test
#code is creating a data frame between Bigrams and Random

t.test(mean_rt~Stimulus, paired=TRUE, data=normal_bigrams_df)
#Normal vs Bigrams
t.test(mean_rt~Stimulus, paired=TRUE, data=bigrams_random_df)
#Bigrams vs Random
#post-hoc tests for both of the conditions 

#COHENS effect size test
cohens_d(mean_rt~Stimulus, paired=TRUE, data=normal_bigrams_df)
cohens_d(mean_rt~Stimulus, paired=TRUE, data=bigrams_random_df)

#descriptive statistics for ANOVA
mean_sd_tab <- rm_data %>%
  group_by(Stimulus) %>%
  summarise(means=mean(mean_rt), SDs=sd(mean_rt))
mean_sd_tab

#Results Section

#Normal vs Bigrams Results
#Post hoc tests were conducted using Bonferroni-corrected alpha levels of 0.05/3 = 0.017. 
#A paired-samples t-test showed that mean RT was significantly lower for Normal stimuli 
#(M = 833 ms, SD = 148) compared to Bigrams stimuli (M = 925 ms, SD = 165), t(37) = -12.4, 
#p < .001, d = -1.97.

#Bigrams vs Random Results
#Post hoc tests were conducted using Bonferroni-corrected alpha levels of 0.05/3 = 0.017. 
#A paired-samples t-test showed that mean RT was significantly lower for Bigrams stimuli 
#(M = 925 ms, SD = 165) compared to Random stimuli (M = 1078 ms, SD = 195), t(37) = -14.2, 
#p < .001, d = -2.31.

#code will now create a repeated measures ANOVA with lab8_data which doesnt exist

rm_data <- fread("Lab8_data.csv")
View(rm_data)
#data for location and speed

data$Location <- as.factor(data$Location)
data$Subject <- as.factor(data$Subject)
aov(Speed ~ Location + Error(Subject/Location), data_frame)
location_speed_df <- data %>%
  filter(Stimulus == "Location" | Stimulus == "Speed")
summary(location_speed_df)
#this line creates a summary of the repeated measures ANOVA test
#the code creates a data from for Location vs Speed
#this is the repeated measures ANOVA test above

