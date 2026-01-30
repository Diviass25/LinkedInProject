# Set Up Environment
install.packages(c("tidyverse", "tidytext", "textdata"))
library(tidyverse)
library(tidytext)

# Load Sample Data
reviews <- data.frame(
  text = c("I loved this movie, it was fantastic!",
           "Terrible plot and bad acting.",
           "An enjoyable film with great visuals.",
           "I wouldn’t recommend it, very boring."),
  stringsAsFactors = FALSE
)

# Tokenize Text
tidy_reviews <- reviews %>%
  unnest_tokens(word, text)
head(tidy_reviews)

# Use a Sentiment Lexicon
bing <- get_sentiments("bing")
sentiment_reviews <- tidy_reviews %>%
  inner_join(bing, by = "word") %>%
  count(sentiment)
sentiment_reviews

# Visualize Sentiment
ggplot(sentiment_reviews, aes(x = sentiment, y = n, fill = sentiment)) +
  geom_col() +
  labs(title = "Sentiment Counts in Movie Reviews")

# Interpret Results
# Positive words like loved, fantastic, enjoyable, great drive positive sentiment.
# Negative words like terrible, bad, boring drive negative sentiment.
# This simple lexicon-based approach gives a quick snapshot of audience mood.
