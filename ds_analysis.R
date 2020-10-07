# Program Name: ds_analysis.R
# Purpose: This creates the .csv for the full analysis dataset based on the derived listings dataset.

library(tidyverse)
listings = read.csv("derived_data/listings.csv")

analysis = listings %>% 
  filter(property_type %in% c("Condominium","Townhouse","House","Apartment")) %>% 
  select(total_price, property_type, room_type, bathrooms, bedrooms, beds, host_is_superhost,review_scores_rating) %>% 
  filter(complete.cases(.))

write_csv(analysis, "derived_data/analysis.csv")
