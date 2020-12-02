# Hello World!
print("Hello world")
3 + 5
100 / 7.2

# Library Setup
installed.packages('dplyr')
installed.packages('ggplot2')

# Attach Packages
library(dplyr)
library(ggplot2)

# Checkout Packages
search()

# call Iris Dataset
str(iris)
head(iris,10)

# Plot as scatter plot
plot(iris)
plot(iris$Petal.Length, iris$Petal.Width, col=iris$Species)
