# Prediction Models

This repository contains a collection of machine learning models for feauture prediction. The models have been trained on agricultural data and can be used to predict grain yield based on various environmental and genetic factors.

## Models Included

The repository includes the following trained models:

### Bayesian Models
- **BayesA**: A Bayesian hierarchical model with t-distributed priors
- **BayesL**: Bayesian LASSO model with double exponential priors
- **BayesR**: Bayesian Ridge Regression model with Gaussian priors

### Tree-Based Models
- **CatBoost**: Gradient boosting on decision trees with categorical feature support
- **Random Forest**: Ensemble learning model based on multiple decision trees
- **XGBoost**: Extreme Gradient Boosting model for efficient tree-based learning
- **GBM**: Gradient Boosting Machine implementation

### Linear and Other Models
- **PCR**: Principal Component Regression for dimensionality reduction
- **MBoost**: Model-based boosting for regression
- **Linear Model**: Regularized linear regression (LASSO/Ridge)


## Requirements
- R version 4.0.0 or higher
- Packages:
  - BGLR
  - randomForest
  - xgboost
  - catboost
  - glmnet
  - mboost
  - gbm
  - pls

## Citation

If you use these models in your research, please cite:


```
Paper
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

