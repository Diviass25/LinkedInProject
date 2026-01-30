# Set Up Environment
install.packages(c("recommenderlab", "Matrix"))
library(recommenderlab)
library(Matrix)

# Load Sample Data
data("MovieLense")
MovieLense

# Explore the Data
image(MovieLense[1:50, 1:50])

# Build a Recommendation Model
model <- Recommender(MovieLense[1:500], method = "UBCF")

# Generate Recommendations
pred <- predict(model, MovieLense[501:510], n = 5)
as(pred, "list")

# Interpret Results
# Recommendations are based on similarity between users’ rating patterns.
# Users with similar tastes get similar movie suggestions.
# This approach can be extended to products, music, or books.