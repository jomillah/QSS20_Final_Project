## Load Packages: 

library(tidyverse)

## Load Files

sentencing_data <- read_csv("../Data/sentencing_data_for_regression.csv")

## Plotting Gender vs Sentence Severity 

RACE_plot <- sentencing_data %>%
  mutate(RACE = case_when(
    RACE == "White" ~ "White",
    RACE == "Black" ~ "Black",
    RACE == "HISPANIC" | RACE == "White [Hispanic or Latino]" | RACE == "Black [Hispanic or Latino]" ~ "Hispanic",
    TRUE ~ "Other"
  )) %>% 
  group_by(RACE) %>%
  summarize(menz = mean(sentence_length_zscore)) %>%
  ggplot() +
  geom_col(aes(x = RACE, y = menz, fill = RACE)) +
  scale_fill_manual(values = c("light blue", "grey", "light blue", "grey")) +
  labs(x = "Race", y = "Mean Z-Score", title = "Is Race Related to Mean Sentence Severity?") +
  guides(fill = FALSE) +
  theme_minimal()

RACE_plot 

## Exporting Plot 

ggsave(file = "../Output/Visualizations/RACE_plot.png", plot = RACE_plot, units = "px", device = "png")
