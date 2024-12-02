#Script to plot data and model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}


exponential_fun <- function(t) {
  N <- N0*exp(r*t)
  return(N)
}

N0 <- exp(6.8941709) #
  
r <-  0.0100086 #
  
K <- 59790000000  #



ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')



ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() + 
  
  scale_y_continuous(trans='log10')


