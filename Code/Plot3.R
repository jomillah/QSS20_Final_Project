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
## Plot

p3 <- z1 %>%
  arrange(mdy(DISPOSITION_DATE)) %>%
  group_by(judgeid_derived) %>%
  mutate(nth_case = row_number()) %>%
  filter(nth_case > 10) %>%
  ggplot(aes(x = nth_case, y = sentence_length_zscore)) +
  geom_smooth(method = "loess", color = "#6690ad", se = FALSE) +
  labs(x = "Judge's Nth Case", y = "Mean Z-Score", title = "Judge Experience vs. Sentence Severity") +
  theme_minimal()
ggsave(file = "../../Visualizations/plot3.jpeg", plot = p3, units = "px", device = "jpeg")
