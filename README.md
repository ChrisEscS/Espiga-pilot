<code style="color: red;">
  Note for collaborators: The functions have not yet been compiled into an R package. 
  You can find an example R script in the main folder, which demonstrates the use of all functions within its respective environment. 
  Additionally, in the "Functions" folder, you will find each tool available individually.
</code>

# Espiga

## Prediction overview

**Espiga** is an R package that unifies widely used advanced predictive algorithms under a simple and consistent interface. The package includes methods such as boosting, Bayesian approaches, and linear models.
The goal is to remove the technical barrier to using complex machine learning methods and statistical techniques, allowing researchers and data analysts to focus on interpreting results rather than implementing algorithms.
It is designed for ease of use, simplifying the processes of input, model optimization, statistical analysis, and output reporting. The functions are flexible enough to allow users to adjust hyperparameters according to their specific objectives. 


## Included Predictive Methods

Espiga integrates the following predictive methods under a unified syntax:

| Method | Characteristics | Ideal use | References |
|--------|----------------|------------|---------------------|
| **XGBoost** | Tree-based algorithm with extreme gradient boosting | Excellent overall performance on complex data | Chen & Guestrin (2016). XGBoost: A Scalable Tree Boosting System |
| **GradientBoost** | Sequential ensemble technique | Iterative model improvement | Friedman (2001). Greedy Function Approximation: A Gradient Boosting Machine |
| **CatBoost** | Optimized for categorical variables | Data with many categories without the need for precoding | Prokhorenkova et al. (2018). CatBoost: unbiased boosting with categorical features |
| **PCR** (Principal Component Regression) | Combines PCA with regression | Data with high dimensionality and collinearity | Massy (1965). Principal Components Regression in Exploratory Statistical Research |
| **Random Forest** | Ensemble decision trees | Robustness against overfitting, handling nonlinearity | Breiman (2001). Random Forests |
| **Bayesian A** | Adaptive Bayesian approach | Uncertainty quantification, complex data | Clyde et al. (2011). Bayesian Adaptive Sampling for Variable Selection and Model Averaging |
| **Bayesian Lasso** | Lasso-type Bayesian regularization | Variable selection with a probabilistic approach | Park & ​​Casella (2008). The Bayesian Lasso |
| **Bayesian Ridge** | Bayesian Ridge-type regularization | Handling multicollinearity with a Bayesian approach | Tipping (2001). Sparse Bayesian Learning and the Relevance Vector Machine |
| **Linear Lasso** | L1 regularization regression | Automatic variable selection | Tibshirani (1996). Regression Shrinkage and Selection via the Lasso |
| **Linear Ridge** | L2 Regularization Regression | Variance Control for Collinear Predictors | Hoerl & Kennard (1970). Ridge Regression: Biased Estimation for Nonorthogonal Problems |
| **Linear ElasticNet** | Combining L1 and L2 Regularization | Balancing Variable Selection and Variance Control | Zou & Hastie (2005). Regularization and Variable Selection via the Elastic Net |

## Example of use prediction 

Espiga simplifies the application of complex methods with a consistent syntax:

```r
library(espiga)

# Load data
data(mtcars)

# Divide data into training and test
set.seed(123)
indices <- sample(1:nrow(mtcars), size = 0.7*nrow(mtcars))
train_data <- mtcars[indices, ]
test_data <- mtcars[-indices, ]

xg<-xg_model(train_data, test_data, "hp")

xg$prediction

xg$correlation

xg$RMSE
```

## Key Features

### 1. Unified Interface
All predictive methods share the same command structure, eliminating the need to learn multiple syntaxes.

### 2. Automatic Hyperparameter Selection
Espiga includes automatic hyperparameter optimization for each method, but is enough flexible for manual tuning.

### 3. Performance Comparison
The tools includes performance metrics (RMSE and R²).

## Cite

If you use Espiga in your research, please cite it as:
```
Paper
```
## Mixed model overview

The optimization and the selection of representative predictor variables and statistical optimization for mixed models is a constant problem for the reseracher.  As part of its toolkit, we developed functions that automates those process using linear mixed models fitted with ASReml. The start of the process is select optimal variables and avoid the multicolineality, using as reference a correlation matrix. Espiga evaluates exhaustive each selected variable and combination, based on statistical and genetic criteria—including AIC, BIC, heritability, reliability, and both R-squared and adjusted R-squared helping to get the best optimized model according with those statistics. Espiga reduce dimensionality problem, allows the automatization while preserving predictive power and reducing the computational cost.


## Example selected variables 
1. Dummy dataframe
```r
library(dplyr)
library(asreml)

set.seed(123)
#Dummy data
n_genotypes <- 20
n_reps <- 3
n_obs <- n_genotypes * n_reps

# Create basic structure
dummy_data <- data.frame(
  geno = factor(rep(1:n_genotypes, each = n_reps)),
  Rep = factor(rep(1:n_reps, times = n_genotypes)),
  units = 1:n_obs,
  Grain.yield = rnorm(n_obs, mean = 100, sd = 10),  # response variable
  NDVI = rnorm(n_obs, 0.6, 0.05),
  GNDVI = rnorm(n_obs, 0.5, 0.05),
  catboost = rnorm(n_obs, mean = 90, sd = 10),
  mboost = rnorm(n_obs, mean = 80, sd = 5)
)
```
2. Select variables
```r
variables_candidates <- c("catboost", "xgboost", "mboost", "rf", "pcr", 
                          "bayesA", "bayesL", "bayesR", "ll", "le", "lr",  
                          "NDVI_mean", "EVI_mean", "GNDVI_mean")

#Assign groups according correlation matrix
cor<-analyze_correlations(N23.All, variables_candidates)

#Define elements
random_effects <- "~ blockNumber + geno"
residual<-"~ id(units)"

# Function to select variables that give better results according with certain criteria 
rep <- select_representatives(data = dummy_data, response_var = "Grain.yield", variable_groups = cor$variable_groups, random_effects, residual, criterion = "R sq adjusted")

#Note: Dependign of the criteria that you want to use, you need to use this input
#"AIC" = "aic"
#"BIC" = "bic",
#"heritability" = "heritability",
#"reliability" = "reliability",
#"R sq" = "R2",
#"R sq adjusted" = "R2_adj")
```
3. Optimize the model
The function will run each possible combinations of variables and it will storage the models and results with best model according with the different criterions 
```r
optim <- optimize_model(dummy.data, response_var= Grain.yield, rep_selection$representatives, random_effects, residual)

#Check all the results
optim$results_df

#Check results of the best model by criteria
optim$best_model_aic # Here the criteria is AIC
# If you want to see the results with other criterias
# best_model_bic = "BIC"
# best_model_her = "Heritability"
# best_model_r2 = "R^2"
# best_model_adj_r2 = "R^2 adjusted"
# best_model_rel = "Reliability"

#Get the model
optim$best_model_aic_fit 
# If you want the model with other criterias
# best_model_bic_fit = "BIC"
# best_model_her_fit = "Heritability"
# best_model_r2_fit = "R^2"
# best_model_adj_r2_fit = "R^2 adjusted"
# best_model_rel_fit = "Reliability"
```
## Key Features

### 1. Identification of important variables
Select important variables, avoiding multicolineality problems and reducing computational power required.

### 2. Automatic Optimization
The packages includes automatic optimization of the model, and it keeps the flexibility of ASREML.

### 3. Statistical Analysis
Espiga includes statistics metrics.

## Cite

If you use Espiga in your research, please cite it as:
```
