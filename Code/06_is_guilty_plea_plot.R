## Load Packages: 

library(tidyverse)


## Load Files

sentencing_data <- read_csv("../Data/sentencing_data_for_regression.csv")

## Plotting Plea Type vs Sentence Severity

is_guilty_plea_plot <- sentencing_data %>%
  mutate(CHARGE_DISPOSITION = if_else(CHARGE_DISPOSITION == "Verdict Guilty", "Not Guilty", "Guilty")) %>%
  group_by(CHARGE_DISPOSITION) %>%
  summarize(menz = mean(sentence_length_zscore)) %>%
  ggplot() +
  geom_col(aes(x = CHARGE_DISPOSITION, y = menz, fill = CHARGE_DISPOSITION)) +
  scale_fill_manual(values = c("#6690ad", "#c73a40")) +
  labs(x = "Plea Type", y = "Mean Z-Score (Sentence Severity)", title = "How Does Plea Decision Impact Average Sentence Severity") +
  guides(fill = FALSE) +
  theme_minimal()

is_guilty_plea_plot

## Exporting Plot

ggsave(file = "../Output/Visualizations/is_guilty_plea_plot.png", plot = is_guilty_plea_plot, units = "px", device = "png")
