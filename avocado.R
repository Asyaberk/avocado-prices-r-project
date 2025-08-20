# ASYA BERK 122200040

#_____0. Import the selected CSV file into the project
# Dataset: https://www.kaggle.com/datasets/neuromusic/avocado-prices

# Load required libraries
library(ggplot2)
library(dplyr)

# Import the dataset
avocado <- read.csv("avocado.csv")

# Explore the dataset structure
str(avocado)
summary(avocado)
head(avocado)

# Check for missing values
colSums(is.na(avocado))

# Count unique values in each column
sapply(avocado, function(x) length(unique(x)))



# _____1. Identify outliers in your data and give brief information about them.
# Outlier detection for AveragePrice (Plot 1)
boxplot(avocado$AveragePrice,
  main = "Boxplot of Average Price", ylab = "Price ($)"
)
boxplot.stats(avocado$AveragePrice)$out  # Outlier values

# Outlier detection for Total Volume (Plot 2)
boxplot(avocado$Total.Volume,
  main = "Boxplot of Total Volume", ylab = "Volume Sold"
)
boxplot.stats(avocado$Total.Volume)$out  # Outlier values

# Outlier detection for Total Bags (Plot 3)
boxplot(avocado$Total.Bags,
  main = "Boxplot of Total Bags Sold", ylab = "Number of Bags"
)
boxplot.stats(avocado$Total.Bags)$out  # Outlier values



#_____2. Analyze your data using visualizations.
# Histogram of AveragePrice (Plot 4)
hist(avocado$AveragePrice,
     main = "Histogram of Average Price",
     xlab = "Average Price ($)",
     col = "lightcoral",
     border = "black")

# Histogram of log(Total Volume) (Plot 5)
hist(log(avocado$Total.Volume),
     main = "Histogram of Log(Total Volume)",
     xlab = "Log of Total Volume Sold",
     col = "lightseagreen",
     border = "black")

# Scatter plot: AveragePrice vs Log(Total Volume) (Plot 6)
plot(avocado$AveragePrice, log(avocado$Total.Volume),
     main = "Scatter Plot of Price vs Log(Volume)",
     xlab = "Average Price ($)",
     ylab = "Log of Total Volume",
     pch = 19,
     col = "mediumorchid")



#_____3. Use Decision Trees or Random Forest to build a predictive model.
#Split data into training and test sets.
#Explain the dataset and results.

# Load necessary libraries
library(rpart)
library(rpart.plot)

# Create log-transformed variables for better interpretability
avocado$log_volume <- log(avocado$Total.Volume)
avocado$log_4046 <- log(avocado$X4046 + 1)
avocado$log_4225 <- log(avocado$X4225 + 1)
avocado$log_4770 <- log(avocado$X4770 + 1)

# Split the dataset into training and testing sets
set.seed(123)
index <- sample(2, nrow(avocado), replace = TRUE, prob = c(0.8, 0.2))
train_data <- avocado[index == 1, ]
test_data <- avocado[index == 2, ]

# Train a regression decision tree model using log-transformed variables
#(region removed for simplicity)
model_log <- rpart(
  AveragePrice ~ log_volume + log_4046 + log_4225 + log_4770 + type + year,
  data = train_data,
  method = "anova",
  control = rpart.control(cp = 0.02)
)

# Visualize the decision tree (Plot 7)
rpart.plot(
  model_log,
  type = 4,
  extra = 1,               # Display number of observations in each node
  box.palette = "Purples", # Elegant color palette for presentation
  shadow.col = "gray",
  main = "Log-Transformed Decision Tree for Avocado Prices",
  cex = 0.6
)

# Predict on the test set and calculate Mean Squared Error
predictions <- predict(model_log, newdata = test_data)
mse <- mean((predictions - test_data$AveragePrice)^2)
print(paste("MSE:", round(mse, 2)))
