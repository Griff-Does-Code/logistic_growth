

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

## Modelling linearized data in fit_linear_model.R

This script calculates the key parameters of the logistic growth model for Escherichia coli: initial population size (N₀), exponential growth rate (r), and carrying capacity (K), using two separate linear models applied to the raw data.

The first linear model estimates the initial population size (N₀) and the exponential growth rate (r) by focusing on the early stages of growth, specifically the initial and exponential phases when the population size is much smaller than the carrying capacity (K >> N₀) and time is relatively short. This corresponds to the linear portion of the second plot in the plot_data.R file. To isolate this phase, the data was subset to include time points under 1500 minutes. For this analysis, the population size was transformed using the natural logarithm, meaning that parameters derived from this model may need to be exponentiated to reverse the transformation. A linear model was then fit to the relationship between time and ln(population size) during the exponential growth phase. The model output provides estimates for N₀ (the intercept) and r (the slope).

The second linear model focuses on the plateau phase of the growth curve to estimate the carrying capacity (K). This phase does not require any log transformation. Here, the data was subset to include only time points beyond 2500 minutes, when the population has stabilized and reached its carrying capacity. Since the population size is stable at this point, no independent variable is applied to the model—only the intercept is estimated, which corresponds to the mean population size at carrying capacity. The model output thus provides an estimate of K, the population's carrying capacity.



## Model and plot in plot_data_and_model.R

Finally, we define a logistic growth function using the estimated parameters for N₀, r, and K, which were obtained from the linear model outputs. This function is then plotted over the raw data to visualize the fit of the logistic growth model. These parameter estimates, derived from analyzing the entire dataset, offer the most accurate values, as they reduce potential error. For example, it is more reliable to use the model-estimated N₀ than to rely on the first data point in the dataset, as the model incorporates information from across the entire dataset, thereby reducing the error that might arise from using a single observation. We then overlay the logistic growth curve on both the transformed and untransformed versions of the data to assess the model's fit visually. The logistic growth curve is based on the theoretical framework outlined in the README.md file of this repository: https://github.com/josegabrielnb/reproducible_research. 

## Results

The first model summary suggests that N0 is exp^6.8941709 so,

**N0 = 987** (to the nearest whole colony.)

The first model summary suggests, 

**r = 0.01** (to two d.p)

The second model summary suggests that, 

**K is 6x10^10**

MODEL PLOT FIT – finally our model plots, that used a function built from our data set models, closely followed our data when plotted over it, suggesting the model is robust.

Lastly, an addition to the analysis would be to express the doubling time (Td) if interested, we can perform :
Td = ln(2) / r
 ≈69.23 minutes (when r = 0.0100086)


 # Question 2 : calculate the population size at t = 4980 min, assuming that the population grows exponentially. How does it compare to population size under logicstic growth?

The code for this question can be found in the comparing_graphs.r script of this repository.
Exponential growth compounds over time. Meaning that at each successive time point the population will get larger and larger at accelerating jumps.  There are also no limiting factors under exponential growth meaning the growth continues indefinitely.


Our derived parameters:
**No  -> 987**

**r ->  0.01**

**t = 4980**

The exponential growth equation :
Nt = N0(1+r)^(t) 

Where:

N0 = starting population size of the culture

K = carrying capacity

r = growth rate


So,population size when time is 4980 is : 
N = 987 x (0.01 +1)^(4980) =  **3.271587877x10^24**
(also performed in r, see comparing_graphs.r)

Under logistic growth the model estimates (logistic_fun(4980)) = No  -> 987
r ->  0.01
t=4980

exponential growth curve - >

N = N0 x ert

N = 987 x e0.01 x 4980 =  4.370846e+24
(also performed in r, see comparing_graphs)

Under logistic growth the model estimates (logistic_fun(4980)) **5.979x10^10**, a much smaller population than that predicted by exponential functions, by 14 orders of magnitude. 
So exponential model output is a much larger population size than logistic growth does, which makes sense since exponentials grow very quickly and aren’t limited.



 

