#Question 2:
#----
growth_data <- read.csv("experiment.csv")
N0 <- exp(6.8941709) #

r <-  0.0100086 #

K <- 59790000000  #


#exponential function and population at time 4980
exponential_fun <- function(t) {
  N <- N0*exp(r*t)
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
#creating a logisitc growth graph 
#logistic growth

#creating a logistic growth graph (with data points)

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red", size = 1) +
  
  geom_point() + 
  
  theme_bw()

#creating a logisitic growth graph (without data points)

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red", size = 1) +
  labs(
    x = "Time (mins)",        # Label for the x-axis
    y = "Population size",  # Label for the y-axis
    title = "Logistic Growth Curve") +
  theme_bw()

#creating an exponential growth graph (without data points)

ggplot(aes(t,N), data = growth_data) +
  geom_function(fun = exponential_fun, colour="green", size = 1) +
  labs(
    x = "Time (mins)",        # Label for the x-axis
    y = "Population size",  # Label for the y-axis
    title = "Exponential Growth Curve") +# Optional: Add a title
  theme_bw()


#creating an exponential growth graph (with data points)
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun = exponential_fun, colour="green", size = 1) +
  geom_point() + 
  theme_bw()


#creating an exponential growth graph (with data points) that is log scaled
  
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun = exponential_fun, colour="green", size = 1) +
  geom_point() + 
  theme_bw() +
  scale_y_continuous(trans='log10')

#creating an logistic growth graph (with data points) that is log scaled
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red", size = 1) +
  
  geom_point() + 
  
  theme_bw() + 
  scale_y_continuous(trans='log10')
#----

library(ggplot2)
 
ggplot(aes(t, N), data = growth_data) +
  geom_function(aes(colour = "Logistic"), fun = logistic_fun, size = 1) +  # Logistic function
  geom_function(aes(colour = "Exponential"), fun = exponential_fun, size = 1) +  # Exponential function
  scale_y_continuous(trans = 'log10') +  # Log10 transformation for y-axis
  labs(
    x = "Time (mins)",        # Label for x-axis
    y = "Log Population Size",# Label for y-axis
    title = "Growth Curves",  # Plot title
    colour = "Model Type"     # Label for the legend
  ) +
  scale_colour_manual(values = c("Logistic" = "darkgreen", "Exponential" = "orange")) +  # Define colors for each curve
  theme_linedraw() +  # Apply clean black-and-white theme
  theme(
    legend.position = c(0.1, 0.9),   # Position the legend at the top-left
    legend.background = element_rect(fill = "white", color = "black", size = 0.5),  # Add white background and border
    plot.title = element_text(family = "Arial", face = "bold", size = 18, color = "black", hjust = 0.5),  # Center title horizontally
    axis.title.x = element_text(family = "Helvetica", face = "bold", size = 14, color = "black"),  # Custom font for x-axis title
    axis.title.y = element_text(family = "Helvetica", face = "bold", size = 14, color = "black"),  # Custom font for y-axis title
    legend.title = element_text(family = "Helvetica", face = "bold", size = 10, color = "black")  # Custom font for legend title
  )


#----


