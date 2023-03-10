## Samson O'Donnell
##
##
## Date: March 9

library(tidyverse)
library(rvest)
library(selectr)
library(ggplot2)
library(maps)
library(ggrepel)
library(lubridate)
library(USAboundaries)

## Load Files
z1 <- read_csv("../../Data/sentencing_data_withZ.csv")
## Create Plot

p4 <- z1 %>%
  group_by(RACE) %>%
  mutate(RACE = if_else(RACE == "ASIAN", "Asian", RACE)) %>%
  mutate(RACE = if_else(RACE == "White [Hispanic or Latino]", "Hispanic", RACE)) %>%
  mutate(RACE = if_else(RACE == "HISPANIC", "Hispanic", RACE)) %>%
  mutate(RACE = if_else(RACE == "White/Black [Hispanic or Latino]", "Hispanic", RACE)) %>%
  filter(RACE != "Unknown") %>%
  summarize(menz = mean(sentence_length_zscore, na.rm = TRUE)) %>%
  ggplot() +
  geom_col(aes(x = RACE, y = menz, fill = RACE)) +
  scale_fill_manual(values = c("Hispanic" = "#6690ad", "Biracial" = "#6690ad", "Asian" = "#c73a40", "White" = "#c73a40", "Black" = "#c73a40", "American Indian" = "#c73a40")) +
  labs(x = "Race", y = "Mean Z-Score", title = "Race vs. Sentence Severity") +
  guides(fill = FALSE) +
  coord_flip() +
  theme_minimal()

ggsave(file = "../../Visualizations/plot4.jpeg", plot = p4, units = "px", device = "jpeg")
