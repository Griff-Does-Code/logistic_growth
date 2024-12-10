

# Question 1 : Detailed information on the analysis.
The purpose of this analysis was to model the growth of _E.coli_ suspended in media, in a reproducible way. 

## Summary:
The following data analysis examines a logistic growth pattern _Escherichia coli_ under controlled conditions. Logisitc growth occurs for many bacterial colonies when suspended in growth media with a fixed resource supply. Logistic growth proceeds as follows: at the start, when the bacterial population is small, growth occurs at a steady rate. As the population increases, it enters an exponential growth phase where the rate of growth accelerates. However, as resources become scarce, the growth rate slows and eventually stabilizes, resulting in a plateau when the population reaches its environmental carrying capacity. This pattern of growth creates a sigmoidal growth curve. The bacterial population will reach exponential growth, but eventually plateau as resource limitations set in, reaching a maximum carrying capacity.

This analysis aims to fit a logistic growth model to the raw data. This is done by estimating three key arguments for logistic growth, N0, r and K obtained from linear modelling of the raw data. The final step of the analysis assesses how well the logistic growth model aligns with the observed data, providing insights into the population dynamics of E. coli in this experimental setting.

## Data: 
The data used for this analysis comes from the experiment.csv file, which can be found at (https://osf.io) by typing in experiment.csv and selecting the file authored by Jose Gabriel Nino Barreat. 
The CSV of the raw data is also linked to this git hub repository.
The data from the csv file consists of two columns with headings 't' and 'N'. 
't' is the time passed since the culture was mixed (in minutes) and 'N' is the population size of the bacteria _(Escherichia coli)_ at that time point.

## Exploratory plots of raw data in plot_data.R script

The initial R script (plot_data.R) visualizes the raw data using the ggplot2 package, generating two scatter plots to help identify general trends in the population growth of _Escherichia coli_.

The raw data is imported and plotted on a graph with continuous x- and y-axes, where time is represented on the x-axis and population size on the y-axis. The resulting plot reveals a growth pattern that appears sigmoidal, consistent with the expectations of logistic growth. The plot illustrates a gradual initial growth phase, followed by an exponential growth stage, and then a plateau, which is interpreted as the carrying capacity of the environment.

A second plot is created with a log base 10 transformation applied to the population size (the y-variable). This transformation compresses the y-axis, so that the exponential growth phase becomes a straight line. On a semi-logarithmic plot, this linear relationship with a plateau is a characteristic indicator of logistic growth. As with the first plot, the population size eventually levels off, reaching a plateau that could correspond to the carrying capacity.

## Modelling linearized data in fit_linear_model.R

This script calculates the key parameters of the logistic growth model for _Escherichia coli_ : initial population size (N₀), exponential growth rate (r), and carrying capacity (K), using two separate linear models applied to the raw data.

The first linear model estimates the initial population size (N₀) and the exponential growth rate (r) by focusing on the early stages of growth, specifically the initial and exponential phases when the population size is much smaller than the carrying capacity (K >> N₀). This corresponds to the linear portion of the second plot in the plot_data.R file. To isolate this phase, the data was subsetted to include time points less than 1500 minutes. Then a natural log of the population size was used, this allows for the data to be linearized and for linear analysis methods to be used. The log transformation means that the N0 parameter derived from this model needs to be exponentiated to reverse the transformation. A linear model was fit to the linearized relationship between time and ln(population size) at below 1500 minutes. The model output therefore provides estimates for N₀ (the intercept) and r (the slope).

The second linear model focuses on the plateau phase of the growth curve to estimate the carrying capacity (K). This phase does not require any log transformation. Here, the data was subset to include only time points beyond 2500 minutes, when the population has stabilized and reached its carrying capacity. Since the population size is stable at this point, no independent variable is applied to the model, so only the intercept is estimated. The intercept from the summarry corresponds to the mean population size at carrying capacity, providing an estimate of K.


## Model and plot in plot_data_and_model.R

Finally, we define a logistic growth function using the estimated parameters for N₀, r, and K, which were obtained from the linear model outputs. This function is then plotted over the raw data to visualize the fit of the logistic growth model. These parameter estimates, offer the most accurate values as they incroporate data points from the enitre data set, minimising the effect of anomalies and thereby increasing the accuracy and precision of the results. Our model is plotted as a logistic growth curve on both the log transformed and untransformed versions of the data to assess the model's fit visually. The logistic growth curve is based on the theoretical framework outlined in the README.md file of this repository: https://github.com/josegabrielnb/reproducible_research. 

## Results

The first model summary suggests that the intercept (ln(starting bacterial population size) is 6.8941709 so the exponent of that yields, **N0 = 987** (to the nearest whole colony.)

The first model summary suggests that gradient (growth rate) is 0.0100086 ,  **r = 0.01** (to two d.p)

The second model summary suggests that K (carrying capacity) is,  **K is 6x10^10**

Our model plots, that used a function built from our data set estimated arguments, closely followed our data when plotted over it, suggesting the model is robust.

An addition to the analysis is to express the doubling time (Td) of the bacterial colony, if interested, we can perform :
Td = ln(2) / r
 ≈69.23 minutes (when r = 0.0100086)


 # Question 2 : calculate the population size at t = 4980 min, assuming that the population grows exponentially. How does it compare to population size under logicstic growth?

The code for this question can be found in the comparing_graphs.r script of this repository.
Exponential growth compounds over time, the rate of its growth is proportional to its size.  There are also no limiting factors under exponential growth meaning the growth continues indefinitely.

The exponential growth equation :
N(t) = N0(1+r)^t 

Where:

N0 = starting population size of the culture

K = carrying capacity

r = growth rate


Our derived parameters:

**No  -> 987**

**r ->  0.01**

**K ->  6x10^10**

And we are evaluating at time :

**t = 4980**


So,population size, under exponential growth, when time is 4980 is : 
N = 987 x (0.01 +1)^(4980) =  3.271587877x10^24 or  **3.27x10^24** (3sf)
(also performed in r, which pulls a more acccurate answer, of the same order of magnitude, see comparing_graphs)

Under logistic growth the model (logistic_fun(4980)) estimates **6x10^10** for population size at 4980 minutes, (the same figure for carrying capacity - meaninig the population reached this environemntal capacity) which is 14 orders of magnitude smaller than the population estimated by the exponential function. 
So exponential model output is a much larger population size than logistic growth model output, which makes biological sense since exponentials grow very quickly and aren’t limited, whereas logistic growth curves are limited at the carrying capacity by resource limitations.

# Question 3 : A graph comparing the two models 

See code for this in comparing_graphs.R script.

 ![Screenshot 2024-12-10 at 13 49 52](https://github.com/user-attachments/assets/deaee814-6911-4fe6-a4ea-dedfc4656dea)


