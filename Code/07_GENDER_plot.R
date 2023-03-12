## Load Packages: 

library(tidyverse)

## Load Files

sentencing_data <- read_csv("../Data/sentencing_data_for_regression.csv")

## Plotting Gender vs Sentence Severity 

GENDER_plot <- sentencing_data %>%
  filter(GENDER == "Male" | GENDER == "Female") %>% 
  group_by(GENDER) %>%
  summarize(menz = mean(sentence_length_zscore)) %>%
  ggplot() +
  geom_col(aes(x = GENDER, y = menz, fill = GENDER)) +
  scale_fill_manual(values = c("#ffc0cb", "#6690ad")) +
  labs(x = "Is Male", y = "Mean Z-Score", title = "Is Gender Related to Mean Sentence Severity?") +
  guides(fill = FALSE) +
  theme_minimal()

GENDER_plot 

## Exporting Plot 

ggsave(file = "../Output/Visualizations/GENDER_plot.png", plot = GENDER_plot, units = "px", device = "png")
