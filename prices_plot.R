# library(tidyverse)
# 
# listings = read.csv("source_data/listings.csv")
# names(listings)

p = ggplot(data=listings,aes(x=price,y=beds)) + 
  geom_point() +
  scale_x_continuous()
#beds host_is_superhost property_type

head(listings$price)
