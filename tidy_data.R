library(tidyverse)
listings = read.csv("source_data/listings.csv")

listings$price = as.numeric(sub('.', '', listings$price))

write_csv(listings, "derived_data/listings.csv")
