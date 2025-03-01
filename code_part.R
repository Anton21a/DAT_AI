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
data <- read_delim("WVS_subset.csv", delim = ",", quote = '"')

data <- data %>%
  filter(B_COUNTRY == 124) %>%
  select(
    year = A_YEAR,
    religion_importance = Q6,
    happiness = Q46,
    gender = Q260,
    age = Q262,
    religion = Q289,
    financial_satisfaction = Q50,
    living_standard = Q56,
    trust_people = Q57,
    trust_family = Q58,
    trust_foreigners = Q63
  )

write.csv(data, "data.csv")
