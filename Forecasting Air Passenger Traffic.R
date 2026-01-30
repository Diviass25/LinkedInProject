# Set Up Environment
install.packages(c("forecast", "ggplot2"))
library(forecast)
library(ggplot2)

# Load the Data
data("AirPassengers")
ts_data <- AirPassengers
plot(ts_data)

# Explore the Data
summary(ts_data)
boxplot(ts_data ~ cycle(ts_data), xlab="Month", ylab="Passengers", main="Monthly Boxplot")

# Build a Forecasting Model
model <- auto.arima(ts_data)
summary(model)

# Forecast Future Values
forecasted <- forecast(model, h = 24)  # forecast next 2 years
plot(forecasted)

# Interpret Results
# The forecast shows continued growth in passenger numbers.
# Seasonal peaks and troughs are captured well by the ARIMA model.
# Useful for airlines to plan capacity and resources.
