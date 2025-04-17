
# Espiga

## Overview

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

## Example of use

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

