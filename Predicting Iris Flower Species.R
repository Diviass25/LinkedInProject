# Set Up Environment
install.packages(c("tidyverse", "caret"))
library(tidyverse)
library(caret)

# Load the Data
data("iris")
head(iris)

# Explore the Data
summary(iris)
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point()

# Split into Train/Test
set.seed(123)
trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# Build a Model
model <- train(Species ~ ., data = trainData, method = "rpart")
print(model)

# Evaluate the Model
predictions <- predict(model, newdata = testData)
confusionMatrix(predictions, testData$Species)

# Visualize the Tree
install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(model$finalModel)
