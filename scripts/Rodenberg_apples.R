#https://github.com/FransRodenburg/Biostatistics/tree/main/GLM/Part%202%20-%20Poisson

#https://www.youtube.com/watch?v=i62gffPrZYA

library(ggplot2)

DF <- read.csv("../data/apples.csv")

# Fit the model
GLM <- glm(apples ~ age, family = poisson(link = "log"), data = DF)

ggplot(DF, aes(age,apples)) +
  geom_point() +
  geom_smooth(method="lm", color="orange", se=FALSE) +
  geom_smooth(method = "glm",
              method.args = list(family = poisson(link = "log")))

# Enter the estimates
intercept   <- coef(GLM)[1]
slope       <- coef(GLM)[2]
inverselink <- exp

# Create a large sequence of numbers along the x-axis
x <- seq(0, 3, length.out = 1000)

# Compute the predictions on the scale of the linear predictor
eta <- intercept + slope * x

# Compute the resulting values on the y-axis
y <- inverselink(eta)

# Plot the resulting model
plot(x, y, type = "l")




              