function(train_data, test_data, target_variable,  num.trees = c(100, 300, 500, 750),
max.depth = c(10, 15, 20, 30, 40),
sample.fraction = c(0.5, 0.7, 0.9),
mtry = c(2, 3, 4, 5, 6),
min.node.size= c(1, 3, 5, 10, 15), seed = 123) {
    # Load necessary package
    if (!requireNamespace("randomForest", quietly = TRUE)) {
        install.packages("randomForest")
    }
    library(randomForest)
    
    # Load necessary package
    if (!requireNamespace("factorextra", quietly = TRUE)) {
        install.packages("factorextra")
    }
    library(factorextra)

  # Convert data frames for safety
  train_data <- as.data.frame(train_data)
  test_data <- as.data.frame(test_data)
  
  # Separate predictors (X) and target variable (y)
  X_train <- train_data[, !(names(train_data) %in% target_variable), drop = FALSE]
  y_train <- train_data[[target_variable]]
  
  # Ensure test set contains the same predictors as training set
  X_test <- test_data[, colnames(X_train), drop = FALSE]

  # Convert data to matrices for BGLR
  X_train <- as.matrix(X_train)
  X_test <- as.matrix(X_test)
  y_train <- as.numeric(y_train)
  
    # Create formula dynamically
  formula <- as.formula(paste(target_variable, "~ ."))

 # Initialize best values
  best_rmse <- Inf
  best_correlation <- -Inf
  best_params <- NULL
  best_predictions <- NULL
  best_model <- NULL



  # Loop through parameter combinations
  for(num.trees in num.trees) {
    for(max.depth in max.depth){
      for(sample.fraction in sample.fraction){
        for(mtry in mtry){
          for(min.node.size in min.node.size){
            set.seed(seed)  
            
          
        
    # Train model
    current_model <- ranger::ranger(
      formula = formula,
      data = train_data,
      num.trees = num.trees,
      max.depth = max.depth,
      sample.fraction = sample.fraction,
      mtry = mtry,
      min.node.size = min.node.size,
      seed = seed
    )
    
    # Make predictions
    predictions <- predict(current_model, test_data)$predictions
    
    # Get actual values from the test set
    actual_values <- as.numeric(test_data[[target_variable]])

    
    # Compute RMSE
    rmse <- sqrt(mean((actual_values - predictions)^2))

    # Compute Pearson correlation
    correlation <- cor(predictions, actual_values, use = "complete.obs")
    # Update best parameters if performance improves
        if (rmse < best_rmse | (rmse == best_rmse & correlation > best_correlation)) {
          best_rmse <- rmse
          best_correlation <- correlation
          best_params <- list( num.trees = num.trees,
      max.depth = max.depth,
      sample.fraction = sample.fraction,
      mtry = mtry,
      min.node.size = min.node.size)
          best_predictions <- predictions
          best_model <- current_model
        }
      }
    }
      }
    }
  }
  

  # Return results
  return(list(predictions = best_predictions, 
              RMSE = best_rmse, 
              correlation = best_correlation, 
              best_params = best_params,
              model = best_model))
}
