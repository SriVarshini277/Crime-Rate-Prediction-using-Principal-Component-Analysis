# Crime-Rate-Prediction-using-Principal-Component-Analysis
A statistical analysis project demonstrating dimensionality reduction through PCA to predict crime rates in US cities.

## Overview
This project applies Principal Component Analysis (PCA) to reduce 15 predictor variables to 5 principal components, then builds a regression model to predict crime rates. The analysis compares the trade-offs between model complexity and predictive accuracy.

## Key Results
- **Variance Captured**: First 5 PCs explain ~88-90% of total variance
- **Model Performance**: R² = 0.65
- **Dimensionality Reduction**: 15 variables → 5 components (67% reduction)
- **Comparison**: Full linear model (15 variables) achieved R² = 0.80

## Files in This Repository
- Crime-Rate-Prediction-PCA.R – Main R script implementing PCA model
- uscrime.txt – Dataset with headers
- README.md – Project overview
- writeup.pdf - Project documentation

## Tools Used
- **Language**: R
- **Key Functions**: `prcomp()`, `lm()`
- **Techniques**: PCA, Linear Regression, Model Evaluation

---

*Note: This is an educational project demonstrating statistical learning concepts.*
