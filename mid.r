# Load necessary libraries
library(ggplot2)
library(caret)

# Read the data from the CSV file
aqi_data <- read.csv("aqi_data.csv")

# View the data
head(aqi_data)
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

# Load the dataset
data = pd.read_csv('winequality-red.csv')

# Select the independent variable and dependent variable
X = data[['alcohol']]
y = data['quality']

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create the linear regression model
model = LinearRegression()

# Train the model
model.fit(X_train, y_train)

# Predict using the model
y_pred = model.predict(X_test)

# Plotting
plt.scatter(X_test, y_test, color='blue', label='Actual')
plt.plot(X_test, y_pred, color='red', linewidth=2, label='Predicted')
plt.title('Linear Regression: Alcohol vs Quality')
plt.xlabel('Alcohol')
plt.ylabel('Quality')
plt.legend()
plt.show()

# Evaluation
print(f'Mean Squared Error: {mean_squared_error(y_test, y_pred)}')
print(f'R-squared: {r2_score(y_test, y_pred)}')
from sklearn.preprocessing import PolynomialFeatures

# Transform the data to include polynomial features
poly = PolynomialFeatures(degree=3)
X_poly = poly.fit_transform(X)

# Split the transformed data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X_poly, y, test_size=0.2, random_state=42)

# Create the linear regression model for polynomial regression
model = LinearRegression()

# Train the model
model.fit(X_train, y_train)

# Predict using the model
y_pred = model.predict(X_test)

# Plotting
plt.scatter(X['alcohol'], y, color='blue', label='Actual')
plt.scatter(X_test[:, 1], y_pred, color='red', label='Predicted')
plt.title('Polynomial Regression: Alcohol vs Quality')
plt.xlabel('Alcohol')
plt.ylabel('Quality')
plt.legend()
plt.show()

# Evaluation
print(f'Mean Squared Error: {mean_squared_error(y_test, y_pred)}')
print(f'R-squared: {r2_score(y_test, y_pred)}')

