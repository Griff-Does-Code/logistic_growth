#Script to create scatter plots of the growth data

#read in raw growth data 
growth_data <- read.csv("experiment.csv")

#if required install & load ggplot2
#install.packages("ggplot2")
library(ggplot2)


#a scatter plot with x axis time (t) and y axis population sixe (N)
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()


#a scatter plot with x axis log(time (t)) and y axis population sixe (N)
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')




sink(file = "package-versions.txt")
sessionInfo()
sink()
