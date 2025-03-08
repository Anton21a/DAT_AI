library(dplyr)
library(readr)
library(ggplot2)
library(tidyr)
library(sjlabelled)
library(ggrepel)
library(scales)
library(ggpubr)
library(fixest)
library(lmtest)
library(modelsummary)
library(skimr)
library(corrplot)
library(lubridate)

rm(list=ls())

setwd("C:/Users/Пользователь/Desktop/MA1y/Data_Analysis_AI/WVS")
data <- read_delim("WVS_GDP_merged_data.csv", delim = ",", quote = '"')

library(countrycode)

data$continent <- countrycode(data$B_COUNTRY_ALPHA, origin = "iso3c", destination = "continent")

data <- data %>%
  select(
    gdp = GDP_USD_PPP_per_capita,
    happiness = Q46,
    population = Population,
    continent = continent
  )

data <- na.omit(data)


ggplot(data, aes(x = log(gdp), y = log(happiness))) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) + # Add linear regression line
  labs(title = "GDP per Capita (PPP) vs Happiness",
       x = "GDP per Capita (PPP, USD)",
       y = "Happiness") +
  theme_minimal()

write.csv(data, "data_f.csv")

reg <- lm(log(happiness) ~ log(gdp), data = data)
summary(reg)



