bd <- read.csv(file.choose(),header = TRUE)
attach(bd)
bd
x <- year
y <- Bangladesh
x2 <- x**2

library(ggplot2)
ggplot(bd, aes(x,y)) +
  geom_jitter(height = 2, width = 2) +
  geom_smooth(method = lm, se = FALSE) +
  labs(x = "Year", y = "GDP percapita", title = "Bangladesh GDP percapita")

#linear model y = a + bx
model <- lm(y~x)
summary(model)

#y = a + bx + cx^2
model2 <- lm(y~x+x2)
summary(model2)

#change scale of y(GDP per capita) to logarithm
ggplot(bd, aes(x,log(y))) +
  geom_jitter(height = 2, width = 2) +
  geom_smooth(method = lm, se = FALSE) +
  labs(x = "Year", y = "GDP percapita", title = "Bangladesh GDP percapita")

#try new model 
modelx <- lm(log(y)~x)
summary(modelx)


