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
getwd()
## Load Files
z1 <- read_csv("../../Data/sentencing_data_withZ.csv")
p1 <- z1 %>%
  drop_na(sentence_length_zscore) %>%
  filter(CHARGE_DISPOSITION %in% c("Verdict Guilty", "Plea Of Guilty", "Finding Guilty")) %>%
  mutate(CHARGE_DISPOSITION = if_else(CHARGE_DISPOSITION == "Finding Guilty", "Verdict Guilty", CHARGE_DISPOSITION)) %>%
  group_by(CHARGE_DISPOSITION) %>%
  summarize(menz = mean(sentence_length_zscore)) %>%
  ggplot() +
  geom_col(aes(x = CHARGE_DISPOSITION, y = menz, fill = CHARGE_DISPOSITION)) +
  scale_fill_manual(values = c("#6690ad", "#c73a40")) +
  labs(x = "Case Type", y = "Mean Z-Score", title = "Plea Decision vs. Sentence Severity") +
  guides(fill = FALSE) +
  theme_minimal()
ggsave(file = "../../Visualizations/plot1.jpeg", plot = p1, units = "px", device = "jpeg")
