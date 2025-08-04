#

This repository contains all the scripts and resources used during the analysis of imputantion plant indexes according with the phenological stage and grain yield. The data consist in 3 different location and two consecutive years.     


## Structure
All.csv - Contain all data information.
GDDs.Rmd - GDD calculation for each flight.
GDDs.envi.RData- GDD's R enviromemt. 
Indexes - Calculation of plant indexes and impuntation using as reference the GDDs.
Within 20 - Grain yield imputation with 20% as training data.
Within 20 model- Mixed model 20% training data.
Within mask - Grain yield imputation with reciprocal 50% as training data and 50% as test data.
WithinAll- Grain yield imputation with training data from all location.


## Objetives

## Software 

- R (versión 4.4.1)
- Packages: `asreml`, `ggplot2`, `dplyr`, `tidyr`, `lme4`, .

