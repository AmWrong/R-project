library(readr)
library(ggplot2)
library(dplyr)

#Import coronavirus data
coronavirus <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv")

#look overview of data
class(coronavirus$date) = "date"
str(coronavirus)

#pick some country
thai_covid <- coronavirus %>% filter(country == "Thailand")
confirmed_thai_covid <- thai_covid %>% filter(type == confirmed)
death_thai_covid <- thai_covid %>% filter(type == "death")
recove_thai_covid <- thai_covid %>% filter(type == "recovery")

##data cleaning##
library(rugarch)
library(dynlm)


garchM<-ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
mean.model = list(armaOrder = c(0, 0),include.mean = TRUE,archm = TRUE, archpow =2), distribution.model = "norm")

#plot
#all
ggplot(thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type)) 

#confirmed
ggplot(confirmed_thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type)) 

#death
ggplot(death_thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type)) 

#recovery
ggplot(recove_thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type)) 
 
