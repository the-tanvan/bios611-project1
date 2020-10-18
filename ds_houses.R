# Program Name: ds_houses.R
# Purpose: This creates the .csv of homes with a derived status for outlier.

library(tidyverse)
listings=read.csv("derived_data/listings.csv")

houses = listings %>% filter(property_type == "House")

Q = quantile(houses$total_price, probs=c(.25, .75), na.rm = FALSE)
iqr = Q[2]-Q[1]
up = Q[2]+1.5*iqr 
low = Q[1]-1.5*iqr

houses=listings %>% filter(property_type=="House") %>% mutate(outlier=(total_price > up))

write_csv(houses, "derived_data/houses.csv")

