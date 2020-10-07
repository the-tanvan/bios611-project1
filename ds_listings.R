library(tidyverse)
listings = read.csv("source_data/listings.csv")

listings$price = as.numeric(sub('.', '', listings$price))
listings$cleaning_fee = as.numeric(sub('.', '', listings$cleaning_fee))
listings = listings %>% mutate(total_price = price + cleaning_fee) %>% filter(!is.na(total_price))

write_csv(listings, "derived_data/listings.csv")
