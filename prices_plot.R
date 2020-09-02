library(tidyverse)
library(cowplot)
listings = read.csv("derived_data/listings.csv")

hist = ggplot(listings,aes(x=price)) + 
  geom_histogram(bins=40,fill="#FF585D") + 
  labs(x="",y="Count",title="Histogram of Price for Airbnb Listings") +
  theme(
    axis.line=element_line(color="black",size=.3),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA),
    plot.title = element_text(hjust=0.5)
  )

box = ggplot(listings,aes(x=price)) + 
  geom_boxplot(fill="#FFD6D8",color="#FF585D") +
  labs(x="",y="",title="Boxplot of Price for Airbnb Listings") +
  theme(
    axis.line=element_line(color="black",size=.3),
    axis.ticks.y=element_blank(),
    axis.text.y=element_blank(),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA),
    plot.title = element_text(hjust=0.5)
  )

byroom = ggplot(listings,aes(x=price,y=room_type)) + 
  geom_boxplot(fill="#FFD6D8",color="#FF585D") +
  labs(x="",y="",title="Boxplot of Price by Room Type") +
  theme(
    axis.line=element_line(color="black",size=.3),
    axis.ticks.y=element_blank(),
    axis.text.y=element_blank(),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA),
    plot.title = element_text(hjust=0.5)
  )

bybeds = ggplot(listings,aes(x=price,y=beds)) + 
  geom_point(color="#FF585D") + 
  labs(x="",y="Price (USD)",title="Plot of Beds against Price") +
  theme(
    axis.line=element_line(color="black",size=.3),
    axis.ticks.y=element_blank(),
    axis.text.y=element_blank(),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA),
    plot.title = element_text(hjust=0.5)
  )

p = plot_grid(hist,box,byroom,bybeds,align="v",nrow=4)

ggsave("assets/prices_plot.png", plot=p,height=8)
