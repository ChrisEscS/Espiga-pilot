
# Espiga

Overview

**Spiga** is an R package that unifies widely used advanced predictive algorithms under a simple and consistent interface. The goal is to remove the technical barrier to using complex machine learning methods 
and statistical techniques, allowing researchers and data analysts to focus on interpreting results rather than implementing algorithms.

Espiga consists of tools designed to predict a target feature using widely used algorithms. The package includes methods such as boosting, Bayesian approaches, and linear models.

It is designed for ease of use, simplifying the processes of input, model optimization, statistical analysis, and output reporting. The functions are flexible enough to allow users to adjust hyperparameters according to their specific objectives.

## Instalación

```r
# Desde GitHub
devtools::install_github("yourusername/espiga")

# Cuando esté disponible en CRAN
# install.packages("espiga")
```

## Métodos Predictivos Incluidos

Espiga integra los siguientes métodos predictivos bajo una sintaxis unificada:

| Método | Características | Ideal para | Referencia original |
|--------|----------------|------------|---------------------|
| **XGBoost** | Algoritmo basado en árboles con boosting de gradiente extremo | Excelente rendimiento general, datos complejos | Chen & Guestrin (2016). XGBoost: A Scalable Tree Boosting System |
| **GradientBoost** | Técnica de ensamblaje secuencial | Mejora iterativa del modelo | Friedman (2001). Greedy Function Approximation: A Gradient Boosting Machine |
| **CatBoost** | Optimizado para variables categóricas | Datos con muchas categorías sin necesidad de codificación previa | Prokhorenkova et al. (2018). CatBoost: unbiased boosting with categorical features |
| **PCR** (Principal Component Regression) | Combina PCA con regresión | Datos con alta dimensionalidad y colinealidad | Massy (1965). Principal Components Regression in Exploratory Statistical Research |
| **Random Forest** | Ensamblaje de árboles de decisión | Robustez contra sobreajuste, manejo de no linealidad | Breiman (2001). Random Forests |
| **Bayesian A** | Enfoque bayesiano adaptativo | Cuantificación de incertidumbre, datos complejos | Clyde et al. (2011). Bayesian Adaptive Sampling for Variable Selection and Model Averaging |
| **Bayesian Lasso** | Regularización bayesiana tipo Lasso | Selección de variables con enfoque probabilístico | Park & Casella (2008). The Bayesian Lasso |
| **Bayesian Ridge** | Regularización bayesiana tipo Ridge | Manejo de multicolinealidad con enfoque bayesiano | Tipping (2001). Sparse Bayesian Learning and the Relevance Vector Machine |
| **Linear Lasso** | Regresión con regularización L1 | Selección automática de variables | Tibshirani (1996). Regression Shrinkage and Selection via the Lasso |
| **Linear Ridge** | Regresión con regularización L2 | Control de varianza en predictores colineales | Hoerl & Kennard (1970). Ridge Regression: Biased Estimation for Nonorthogonal Problems |
| **Linear ElasticNet** | Combinación de regularización L1 y L2 | Balance entre selección de variables y control de varianza | Zou & Hastie (2005). Regularization and Variable Selection via the Elastic Net |

## Ejemplo de Uso

Espiga simplifica la aplicación de métodos complejos con una sintaxis consistente:

```r
library(espiga)

# Cargar datos
data(mtcars)

# Dividir datos en entrenamiento y prueba
set.seed(123)
indices <- sample(1:nrow(mtcars), size = 0.7*nrow(mtcars))
train_data <- mtcars[indices, ]
test_data <- mtcars[-indices, ]

# Ajustar múltiples modelos con una sintaxis unificada
modelos <- espiga_fit(
  data = train_data,
  target = "mpg",
  methods = c("xgboost", "random_forest", "bayesian_ridge", "linear_elasticnet"),
  validation = "cv",  # Validación cruzada
  folds = 5
)

# Comparar rendimiento
resultados <- compare_models(modelos)
plot_model_comparison(resultados)

# Predecir con el mejor modelo
predicciones <- predict(modelos$best_model, test_data)

# Explicabilidad del modelo (para métodos compatibles)
importance <- variable_importance(modelos$xgboost)
plot_importance(importance)
```

## Características Principales

### 1. Interfaz Unificada
Todos los métodos predictivos comparten la misma estructura de comandos, lo que elimina la necesidad de aprender múltiples sintaxis.

### 2. Selección Automática de Hiperparámetros
Espiga incluye optimización automática de hiperparámetros para cada método, eliminando la necesidad de ajuste manual.

### 3. Comparación de Rendimiento
Herramientas integradas para comparar el rendimiento de múltiples modelos con métricas estándar (RMSE, MAE, R², etc.).

### 4. Diagnóstico Visual
Funciones para visualizar resultados, importancia de variables y comportamiento del modelo.

### 5. Manejo Inteligente de Datos
Preprocesamiento automático adaptado a los requisitos de cada método predictivo.

## Casos de Uso Típicos

- **Investigación científica**: Modelado predictivo con enfoque en la interpretabilidad
- **Análisis de datos empresariales**: Predicción de métricas clave con comparación de métodos
- **Bioinformática**: Análisis de datos genómicos y proteómicos
- **Economía y finanzas**: Predicción de series temporales e indicadores

## Contribuir

Las contribuciones son bienvenidas. Por favor, consulta el archivo [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles.

## Citar

Si utilizas Espiga en tu investigación, por favor cítalo como:

```
Paper
```

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - vea el archivo [LICENSE.md](LICENSE.md) para más detalles.
```

