#Write R commands that will create two variables,
#“bp” and “cups”, 
#containing the data as vectors,
#then compute a correlation with a significance test. 
#Paste the commands below. 
#Then run the script.
#Is there a significant correlation between blood pressure and the amount of coffee consumed? 
#What is the p-value?
#Describe the relationship between blood pressure and the amount of coffee consumed.

#blood pressure data: x1 = 122 mmHg, x2 = 129 mmHg, x3 = 117 mmHg, x4 = 124 mmHg. 
#average daily coffee consumption: y1 = 1 cup, y2 = 3 cups, y3 = 2 cups, y4 = 2 cups. 

bp <- c(122,129,117,124)
cups <- c(1,3,2,2)
cor(bp,cups)
cor.test(bp,cups)
plot(bp, cups)
