#Question 2:
#----
growth_data <- read.csv("experiment.csv")



N0 <- exp(6.8941709) #

r <-  0.0100086 #

K <- 60000000000  #


#exponential function and population at time 4980
exponential_fun <- function(t) {
  N <- N0*(1+r)^(t)
  return(N)
}

exponential_fun(4980)

#logistic function and population at time 4980
logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

logistic_fun(4980)
#----

#Question 3:
#----
#creating a logisitc growth graph and an exponential growth graph comparison
#----

library(ggplot2)
 
ggplot(aes(t, N), data = growth_data) +
  geom_function(aes(colour = "Logistic"), fun = logistic_fun, size = 1) +  
  geom_function(aes(colour = "Exponential"), fun = exponential_fun, size = 1) +  
  scale_y_continuous(trans = 'log10') +  
  labs(
    x = "Time (mins)", y = expression(~bold("Log"[10] ~ "Population Size")),
    title =  expression(~bold("Comparison of Growth Curves for" ~ bolditalic("E. coli")),  
    colour = "Model Type")) +
  scale_colour_manual(values = c("Logistic" = "darkgreen", "Exponential" = "orange")) +  
  theme_linedraw() +  
  theme(
    legend.position = c(0.1, 0.9),  
    legend.background = element_rect(fill = "white", color = "black", size = 0.5), 
    plot.title = element_text(family = "Arial", face = "bold", size = 18, color = "black", hjust = 0.5),  
    axis.title.x = element_text(family = "Helvetica", face = "bold", size = 14, color = "black"),  
    axis.title.y = element_text(family = "Helvetica", face = "bold", size = 14, color = "black"),  
    legend.title = element_text(family = "Helvetica", face = "bold", size = 10, color = "black")  
  )








#----


