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

p2 <- z1 %>%
  drop_na(sentence_length_zscore) %>%
  group_by(is_male_derived) %>%
  summarize(menz = mean(sentence_length_zscore)) %>%
  ggplot() +
  geom_col(aes(x = is_male_derived, y = menz, fill = is_male_derived)) +
  scale_fill_manual(values = c("#ffc0cb", "#6690ad")) +
  labs(x = "Is Male", y = "Mean Z-Score", title = "Gender vs. Sentence Severity") +
  guides(fill = FALSE) +
  theme_minimal()
ggsave(file = "../../Visualizations/plot2.jpeg", plot = p2, units = "px", device = "jpeg")
