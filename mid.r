# Load necessary libraries
library(ggplot2)
data("iris")

# Fit the linear regression model
linear_model <- lm(Petal.Length ~ Sepal.Length, data = iris)

# Summary of the model
summary(linear_model)

# Plot the data and the regression line
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Linear Regression: Petal Length vs. Sepal Length", x = "Sepal Length (cm)", y = "Petal Length (cm)")
# Scatter plot with linear regression line
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Linear Regression: Petal Length vs. Sepal Length", x = "Sepal Length (cm)", y = "Petal Length (cm)")

# Fit the polynomial regression model
poly_model <- lm(Petal.Length ~ poly(Sepal.Length, 2), data = iris)

# Summary of the model
summary(poly_model)

# Plot the data and the polynomial regression line
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), col = "red") +
  labs(title = "Polynomial Regression: Petal Length vs. Sepal Length", x = "Sepal Length (cm)", y = "Petal Length (cm)")
# Scatter plot with polynomial regression line
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), col = "red") +
  labs(title = "Polynomial Regression: Petal Length vs. Sepal Length", x = "Sepal Length (cm)", y = "Petal Length (cm)")

# Create a binary outcome variable
iris$Is_Setosa <- ifelse(iris$Species == "setosa", 1, 0)

# Fit the logistic regression model
logistic_model <- glm(Is_Setosa ~ Sepal.Length, data = iris, family = binomial)

# Summary of the model
summary(logistic_model)

# Plot the data and the logistic regression curve
ggplot(iris, aes(x = Sepal.Length, y = Is_Setosa)) +
  geom_point(alpha = 0.5) +
  stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE, col = "green") +
  labs(title = "Logistic Regression: Setosa vs. Sepal Length", x = "Sepal Length (cm)", y = "Is Setosa (binary)")
# Scatter plot with logistic regression curve
ggplot(iris, aes(x = Sepal.Length, y = Is_Setosa)) +
  geom_point(alpha = 0.5) +
  stat_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE, col = "green") +
  labs(title = "Logistic Regression: Setosa vs. Sepal Length", x = "Sepal Length (cm)", y = "Is Setosa (binary)")
