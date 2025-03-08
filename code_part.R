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
#write.csv(data, "data.csv")
str(data)

data <- na.omit(data)

data$happiness <- as.factor(data$happiness)
data$religion <- ifelse(data$religion == 1 | data$religion == 2 | data$religion == 3 |
                        data$religion == 8, 1, ifelse(data$religion == 9, 2, 3))
data$religion <- as.factor(data$religion)
data$religion_importance <- as.factor(data$religion_importance)
data$gender <- as.factor(data$gender)
data$living_standard <- as.factor(data$living_standard)
data$trust_people <- as.factor(data$trust_people)
data$trust_family <- as.factor(data$trust_family)
data$trust_foreigners <- as.factor(data$trust_foreigners)
data$financial_satisfaction <- ifelse(data$financial_satisfaction >= 1 & data$financial_satisfaction <= 4, 1,
                                      ifelse(data$financial_satisfaction == 5 |data$financial_satisfaction == 6, 2, 3))
data$financial_satisfaction <- as.factor(data$financial_satisfaction)

data$happiness <- factor(data$happiness, levels = 1:4,
                         labels = c("Very happy", "Quite happy",
                                    "Not very happy", "Not at all happy"))
data$religion_importance <- factor(data$religion_importance, levels = 1:4,
                                   labels = c("Very important", "Rather important",
                                              "Not very important", "Not at all important"))
data$religion <- factor(data$religion, levels = 1:3,
                        labels = c("Christians", "NA", "others"))

data$gender <- factor(data$gender, levels = 1:2, 
                      labels = c("Male", "Female"))

data$financial_satisfaction <- factor(data$financial_satisfaction, levels = 1:3, 
                                      labels = c("low", "medium", "high"))

data$living_standard <- factor(data$living_standard, levels = 1:3, 
                               labels = c("Better off", "Worse off", "About the same"))

data$trust_people <- factor(data$trust_people, levels = 1:2, 
                            labels = c("Most people can be trusted", "Need to be very careful"))

data$trust_family <- factor(data$trust_family, levels = 1:4, 
                            labels = c("Trust completely", "Trust somewhat", "Do not trust very much", "Do not trust at all"))

data$trust_foreigners <- factor(data$trust_foreigners, levels = 1:4, 
                                labels = c("Trust completely", "Trust somewhat", "Do not trust very much", "Do not trust at all"))

ggplot(data, aes(x = happiness, fill = religion_importance)) +
  geom_bar(position = 'fill') +  
  labs(y = "Proportion") +
  theme_classic()

ggplot(data, aes(x = happiness, fill = religion_importance)) +
  geom_bar(position = "dodge") +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5, position = position_dodge(width = 0.9)) +
  labs(title = "Happiness vs. Importance of Religion", x = "Happiness Level", y = "Count", fill = "Religion Importance") +
  theme_classic()

ggplot(data, aes(x = religion_importance, fill = religion)) +
  geom_bar(position = "dodge") +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5, position = position_dodge(width = 0.9)) +
  labs(title = "Religion vs. Importance of Religion", x = "Religion Importance", y = "Count", fill = "Religion Importance") +
  theme_classic()

library(nnet)
model <- multinom(happiness ~ religion_importance + religion + religion_importance*religion +
                    age + gender + financial_satisfaction +
                    trust_people, data = data)

coeff_table <- summary(model)$coefficients  
std_errors <- summary(model)$standard.errors 
t_stats <- coeff_table / std_errors 

results_tidy <- tidy(model, conf.int = TRUE)

results_tidy






