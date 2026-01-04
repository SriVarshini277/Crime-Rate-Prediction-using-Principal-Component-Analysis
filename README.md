# Crime-Rate-Prediction-using-Principal-Component-Analysis
A statistical analysis project demonstrating dimensionality reduction through PCA to predict crime rates in US cities.

## Overview
This project applies Principal Component Analysis (PCA) to reduce 15 predictor variables to 5 principal components, then builds a regression model to predict crime rates. The analysis compares the trade-offs between model complexity and predictive accuracy.

## Key Results
- **Variance Captured**: First 5 PCs explain ~88-90% of total variance
- **Model Performance**: R² = 0.65
- **Dimensionality Reduction**: 15 variables → 5 components (67% reduction)
- **Comparison**: Full linear model (15 variables) achieved R² = 0.80

## Methodology
1. Standardized 15 predictor variables
2. Applied PCA using R's `prcomp()` function
3. Selected first 5 principal components
4. Built linear regression model on PC scores
5. Back-transformed coefficients to original variable space
6. Evaluated model performance and compared with baseline

## Trade-offs
**Advantages:**
- Reduced overfitting risk
- Eliminates multicollinearity
- Better generalization potential

**Disadvantages:**
- Lower predictive accuracy vs full model
- Reduced interpretability
- Information loss from discarded components

## Tools Used
- **Language**: R
- **Key Functions**: `prcomp()`, `lm()`
- **Techniques**: PCA, Linear Regression, Model Evaluation

---

*Note: This is an educational project demonstrating statistical learning concepts.*
