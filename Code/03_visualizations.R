## Loading Packages:

library(tidyverse)

## Importing Plot Function (ggplot2):

library(ggplot2)

## Reading in Data

sentencing_data <- read_csv("../Data/sentencing_data_for_analysis.csv")

## Making sure data imported correctly: 

head(sentencing_data)

## Plotting Judge Experience vs Sentence Severity (With nth_case)

nth_case_plot <- sentencing_data %>%
  ggplot(aes(x = nth_case, y = sentence_length_zscore)) +
  geom_smooth(method = "loess", color = "#6690ad", se = FALSE) +
  labs(x = "Judge's Nth Case", y = "Z-Score (Sentence Severity)", title = "Is There A Relationship Between Judicial Experience and Sentence Severity?") +
  ylim(-1, 1) +
  theme_minimal() 

print(nth_case_plot)

## Exporting Judicial Experience Plot

ggsave(file = "../Output/Visualizations/nth_case_plot.png", plot = nth_case_plot, units = "px", device = "png")

## Plotting Age vs Sentence Severity (With age_derived)

age_derived_plot <- sentencing_data %>%
  ggplot(aes(x = age_derived, y = sentence_length_zscore)) +
  geom_smooth(method = "loess", color = "red", se = FALSE) +
  labs(x = "Defendant Age", y = "Z-Score (Sentence Severity)", title = "Is There A Relationship Between Defendant Age and Sentence Severity?") +
  ylim(-1, 1) +
  theme_minimal() 

print(age_derived_plot)


## Exporting Age Plot

ggsave(file = "../Output/Visualizations/age_derived_plot.png", plot = age_derived_plot, units = "px", device = "png")

## Plotting Plea Type vs Sentence Severity (with CHARGE_DISPOSITION)

is_guilty_plea_plot <- sentencing_data %>%
  mutate(CHARGE_DISPOSITION = if_else(CHARGE_DISPOSITION == "Verdict Guilty", "Not Guilty", "Guilty")) %>%
  group_by(CHARGE_DISPOSITION) %>%
  summarize(menz = mean(sentence_length_zscore)) %>%
  ggplot() +
  geom_col(aes(x = CHARGE_DISPOSITION, y = menz, fill = CHARGE_DISPOSITION)) +
  scale_fill_manual(values = c("#6690ad", "#c73a40")) +
  labs(x = "Defendant Plea Type", y = "Mean Z-Score (Sentence Severity)", title = "How Does Defendant Plea Type Impact Average Sentence Severity?") +
  guides(fill = FALSE) +
  theme_minimal()

print(is_guilty_plea_plot)

## Exporting Plea Type Plot

ggsave(file = "../Output/Visualizations/is_guilty_plea_plot.png", plot = is_guilty_plea_plot, units = "px", device = "png")

## Plotting Gender vs Sentence Severity (with GENDER)

GENDER_plot <- sentencing_data %>%
  filter(GENDER == "Male" | GENDER == "Female") %>% 
  group_by(GENDER) %>%
  summarize(menz = mean(sentence_length_zscore)) %>%
  ggplot() +
  geom_col(aes(x = GENDER, y = menz, fill = GENDER)) +
  scale_fill_manual(values = c("#ffc0cb", "#6690ad")) +
  labs(x = "Defendant Gender", y = "Mean Z-Score (Sentence Severity)", title = "Is Defendant Gender Related to Average Sentence Severity?") +
  guides(fill = FALSE) +
  theme_minimal()

print(GENDER_plot) 

## Exporting Gender Plot 

ggsave(file = "../Output/Visualizations/GENDER_plot.png", plot = GENDER_plot, units = "px", device = "png")

## Plotting Race vs Sentence Severity (With RACE)

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
  labs(x = "Defendant Race", y = "Mean Z-Score (Sentence Severity)", title = "Is Defendant Race Related to Average Sentence Severity?") +
  guides(fill = FALSE) +
  theme_minimal()

print(RACE_plot) 

## Exporting Race Plot 

ggsave(file = "../Output/Visualizations/RACE_plot.png", plot = RACE_plot, units = "px", device = "png")


