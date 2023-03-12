## Loading Packages:

library(tidyverse)

## Reading in Files

sentencing_data <- read_csv("../Data/sentencing_data_for_regression.csv")

head(sentencing_data)

## Plotting Age vs Sentence Severity (With age_derived)

age_derived_plot <- sentencing_data %>%
  ggplot(aes(x = age_derived, y = sentence_length_zscore)) +
  geom_smooth(method = "loess", color = "red", se = FALSE) +
  labs(x = "Age", y = "Z-Score (Sentence Severity)", title = "Is There A Relationship Between Defendant Age and Sentence Severity?") +
  ylim(-1, 1) +
  theme_minimal() 

age_derived_plot


## Exporting plot

ggsave(file = "../Output/Visualizations/age_derived_plot.png", plot = age_derived_plot, units = "px", device = "png")
