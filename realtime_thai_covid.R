library(readr)
library(ggplot2)
library(dplyr)

#Import coronavirus data
coronavirus <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv")

#look overview of data
str(coronavirus)

#filter for Thai data 
thai_covid <- coronavirus %>% filter(country == "Thailand")
confirmed_thai_covid <- thai_covid %>% filter(type == "confirmed")
death_thai_covid <- thai_covid %>% filter(type == "death")
recove_thai_covid <- thai_covid %>% filter(type == "recovery")

#plot
#all include confirmed, death and recovery
ggplot(thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type )) 

#only confirmed
ggplot(confirmed_thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type)) 

#only death
ggplot(death_thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type)) 

#only recovery
ggplot(recove_thai_covid, aes(date, cases)) +
  geom_point(aes(date, cases, color = type)) 
