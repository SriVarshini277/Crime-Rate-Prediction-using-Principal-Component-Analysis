#Load the crime data from the website
crime_data <- read.table("http://www.statsci.org/data/general/uscrime.txt", header = TRUE)
head(crime_data)

#Separating X (predictors) and Y (Crime)
X <- crime_data[, 1:15] 
Y <- crime_data[, 16]    

#Do PCA on the predictors. Look summary and plot
pca <- prcomp(X, scale. = TRUE)
summary(pca)
screeplot(pca, type = "lines")

#Pick first 5 PCs and get their scores
pc_scores <- pca$x[, 1:5]
#Build regression using PC scores
pc_model <- lm(Y ~ pc_scores)
summary(pc_model)

#Convert PC model back to original variables
#Get the rotation matrix for first 5 PCs
rotation <- pca$rotation[, 1:5]
#Get PC coefficients
pc_coef <- pc_model$coefficients[2:6]
#Multiply to get original variable coefficients (scaled)
beta_scaled <- rotation %*% pc_coef

#Unscale the coefficients
scales <- pca$scale
centers <- pca$center
beta_original <- beta_scaled / scales

#Calculate intercept
intercept <- pc_model$coefficients[1] - sum(beta_original * centers)

#Print the final model
print("Final Model Coefficients:")
cat("Intercept:", intercept, "\n")
print(beta_original)

#Make predictions on training data
predictions <- intercept + as.matrix(X) %*% beta_original

#Calculate R-squared
SSE <- sum((Y - predictions)^2)
SST <- sum((Y - mean(Y))^2)
R2 <- 1 - SSE/SST
cat("\nR-squared:", R2, "\n")

#Test on new city
new_city <- data.frame(M=14.0, So=0, Ed=10.0, Po1=12.0, Po2=15.5,
                       LF=0.640, M.F=94.0, Pop=150, NW=1.1,
                       U1=0.120, U2=3.6, Wealth=3200, Ineq=20.1,
                       Prob=0.04, Time=39.0)

new_prediction <- intercept + as.matrix(new_city) %*% beta_original
cat("\nPredicted crime for new city:", new_prediction, "\n")