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
library(ggmap)
library(tidycensus)
## Load Files
z1 <- read_csv("../../Data/sentencing_data_withZ.csv")
## Create Plot
cook_county <- get_acs(geography = "tract", 
                       variables = "B01001_001", 
                       state = "IL", 
                       county = "Cook",
                       geometry = TRUE)
zz <- z1 %>%
  filter(SENTENCE_COURT_NAME != "PROMIS") %>%
  group_by(SENTENCE_COURT_NAME) %>%
  summarize(menz = mean(sentence_length_zscore, na.rm = TRUE), whitez = mean(is_white_derived, na.rm = TRUE))

district_courts <- data.frame(
  SENTENCE_COURT_NAME = c("District 1 - Chicago", "District 2 - Skokie", "District 3 - Rolling Meadows",
                 "District 4 - Maywood", "District 5 - Bridgeview", "District 6 - Markham"),
  address = c("2650 S. California Ave., Chicago, IL", "5600 Old Orchard Rd., Skokie, IL",
              "2121 Euclid Ave., Rolling Meadows, IL", "1500 Maybrook Ave., Maywood, IL",
              "10220 S. 76th Ave., Bridgeview, IL", "16501 S. Kedzie Ave., Markham, IL")
)

# Obtain the latitude and longitude for each court address
register_google(key = "AIzaSyB3Ri_bdIKcTqjOA2ccWkbsdgzxTl80xQc")
district_courts_geocoded <- geocode(district_courts$address)
# combine the geocoded data with the original data frame
district_courts <- cbind(district_courts, district_courts_geocoded)
joined1 <- inner_join(district_courts, zz, by = "SENTENCE_COURT_NAME")
# print the resulting data frame with the latitude and longitude coordinates
p5 <- joined1 %>%
  mutate(whitez1 = (whitez * 100)) %>%
  ggplot() +
  geom_sf(data = cook_county, aes(geometry = geometry)) +
  geom_point(aes(x = lon, y = lat, size = whitez1, color = menz)) +
  scale_color_gradient(name = "Mean Z-score", low = "#6690ad", high = "#c73a40") +
  labs(size = "White Population (%)", title = "Sentencing Disparities by District Court (White Pop. vs. Severity)") +
  scale_size(range = c(3, 15)) +
  theme_void()

ggsave(file = "../../Visualizations/plot5.jpeg", plot = p5, units = "px", device = "jpeg")

