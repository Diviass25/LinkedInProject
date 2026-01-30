# Set Up Environment
install.packages(c("tidyverse", "caret"))
library(tidyverse)
library(caret)

# Create Sample Data
set.seed(123)
customers <- data.frame(
  Income = rnorm(200, mean = 50000, sd = 15000),
  SpendingScore = rnorm(200, mean = 50, sd = 25)
)
head(customers)

# Explore the Data
ggplot(customers, aes(x = Income, y = SpendingScore)) +
  geom_point()

# Apply K-Means Clustering
set.seed(123)
kmeans_model <- kmeans(customers, centers = 3)
customers$Cluster <- as.factor(kmeans_model$cluster)

# Visualize Clusters
ggplot(customers, aes(x = Income, y = SpendingScore, color = Cluster)) +
  geom_point() +
  labs(title = "Customer Segmentation with K-Means")

# Interpret Results
# Cluster 1: High income, moderate spending.
# Cluster 2: Low income, low spending.
# Cluster 3: Moderate income, high spending.
