

# Question 1 : Detailed information on the analysis.
The purpose of this analysis was to model the growth of E.coli suspended in media, in a reproducible way. 

## Summary:
The following data analysis examines a logistic growth pattern in the growth of Escherichia coli under controlled conditions. The premise is that, when suspended in growth media with a fixed resource supply, the bacterial population will initially experience exponential growth, but eventually plateau as resource limitations set in, reaching a maximum carrying capacity.

At the outset, when the bacterial population is small, growth occurs at a steady rate. As the population increases, it enters an exponential growth phase where the rate of growth accelerates. However, as resources become scarce, the growth rate slows and eventually stabilizes, resulting in a plateau once the population reaches its carrying capacity. This pattern of growth creates a sigmoidal growth curve.

This analysis aims to evaluate the logistic growth model by fitting it to the data, with parameters estimated through linear modelling techniques. The final step of the analysis assesses how well the logistic growth model aligns with the observed data, providing insights into the population dynamics of E. coli in this experimental setting.

## Data: 
The data used for this analysis comes from the experiment.csv file, which can be found at (https://osf.io) by typing in experiment.csv and selecting the file authored by Jose Gabriel Nino Barreat. 
The CSV of the raw data  is also linked to this git hub repository.
The data from the csv file consists of two columns with headings 't' and 'N'. 
't' is the time passed since the culture was mixed (in minutes) and 'N' and the population size of the bacteria (Escherichia coli) at that time point.

## Exploratory plots of raw data in plot_data.R script

This initial R script (plot_data.R) visualizes the raw data using the ggplot2 package, generating two scatter plots to help identify general trends in the population growth of Escherichia coli.

First, the raw data is imported and plotted on a graph with continuous x- and y-axes, where time is represented on the x-axis and population size on the y-axis. The resulting plot reveals a growth pattern that appears sigmoidal, consistent with the expectations of logistic growth. The plot illustrates a gradual initial growth phase, followed by an exponential growth stage, and then a plateau, which is interpreted as the carrying capacity of the environment.

Next, a second plot is created with a log base 10 transformation applied to the population size (the y-variable). This transformation compresses the y-axis, so that the exponential growth phase becomes a straight line. On a semi-logarithmic plot, this linear relationship is a characteristic indicator of logistic growth. As with the first plot, the population size eventually levels off, reaching a plateau that corresponds to the carrying capacity.

## Modelling


## Model and plot 

## Results
No 
r 
K
The first plot exhibits a sigmoidal curve under what appears to be logisitc growth. It starts at a low population size and begins to rapidly accelerate at around 1500 minutes. It then plateaus off at 2000 minutes with a population size of around 60,000,000,000 (60 billion)

The Second plot exhibits a linear growth (on the log base 10 transformed y axis) with a plateau at 

