## Loading Packages:

library(tidyverse)

## Reading in Files

sentencing_data <- read_csv("../Data/sentencing_data_for_regression.csv")

head(sentencing_data)

## Plotting Judge Experience vs Sentence Severity (With nth_case)

nth_case_plot <- sentencing_data %>%
  ggplot(aes(x = nth_case, y = sentence_length_zscore)) +
  geom_smooth(method = "loess", color = "#6690ad", se = FALSE) +
  labs(x = "Judge's Nth Case", y = "Z-Score (Sentence Severity)", title = "Is There A Relationship Between Judge's Experience and Sentence Severity?") +
  ylim(-1, 1) +
  theme_minimal() 

nth_case_plot

ggsave(file = "../Output/Visualizations/nth_case_plot.png", plot = nth_case_plot, units = "px", device = "png")
