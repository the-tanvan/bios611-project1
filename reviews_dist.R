library(tidyverse)
library(cowplot)

listings = read.csv("source_data/listings.csv")
temp = listings %>% select(review_scores_rating) %>% filter(review_scores_rating > 90)

hist = ggplot(listings,aes(x=review_scores_rating)) + 
  geom_histogram(bins=60,fill="#FF585D") + 
  labs(x="Review Score (out of 100)",y="Count",title="Histogram of Review Scores for Airbnb Listings") +
  theme(
    axis.line=element_line(color="black",size=.3),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA),
    plot.title = element_text(hjust=0.5)
  ) +
  xlim(38,104)

box = ggplot(listings,aes(x=review_scores_rating)) + 
  geom_boxplot(fill="transparent",color="#518972") +
  labs(x="",y="",title="Boxplot of Review Scores for Airbnb Listings") +
  theme(
    axis.line=element_line(color="black",size=.3),
    axis.ticks.y=element_blank(),
    axis.text.y=element_blank(),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA),
    plot.title = element_text(hjust=0.5)
  ) +
  xlim(38,104)

p = plot_grid(box,hist,align="v",nrow=2)

ggsave("assets/reviews_dist.png", plot=p)
