# Program Name: ds_listings.R
# Purpose: This creates the .csv of the listings dataset based on the source data. 
# It is tidied up by changing some variables into numeric form and keeping only obs with total_price (our derived outcome variable).

library(tidyverse)
listings=read.csv("source_data/listings.csv")

listings$price = as.numeric(sub('.', '', listings$price))
listings$cleaning_fee = as.numeric(sub('.', '', listings$cleaning_fee))
listings = listings %>% mutate(total_price = price + cleaning_fee) %>% filter(!is.na(total_price))

write_csv(listings, "derived_data/listings.csv")
