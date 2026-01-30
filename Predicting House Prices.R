# Set Up Your Environment
install.packages(c("tidyverse", "caret", "ggplot2"))
library(tidyverse)
library(caret)
library(ggplot2)

# Get the Data
install.packages("MASS")
library(MASS)
data("Boston")
head(Boston)

# Explore the Data
str(Boston)
summary(Boston)

library(ggplot2)
ggplot(Boston, aes(x = lstat, y = medv)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue")

# Preprocess the Data
library(caret)
set.seed(123)
trainIndex <- createDataPartition(Boston$medv, p = 0.8, list = FALSE)
trainData <- Boston[trainIndex, ]
testData <- Boston[-trainIndex, ]

# Build a Model
model <- lm(medv ~ lstat + rm, data = trainData)
summary(model)

# Evaluate the Model
library(caret)
predictions <- predict(model, newdata = testData)
postResample(predictions, testData$medv)

# Visualize Predictions
ggplot(data.frame(actual = testData$medv, predicted = predictions),
aes(x = actual, y = predicted)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, col = "blue")
