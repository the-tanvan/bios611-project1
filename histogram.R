library(tidyverse)

listings = read.csv("source_data/listings.csv")

temp = listings %>% select(review_scores_rating) %>% filter(review_scores_rating > 90)

p = ggplot(temp,aes(x=review_scores_rating)) + 
  geom_histogram(bins=10,fill="#FF585D") + 
  labs(x="Review Score (out of 100)",y="Count",title="Histogram of Review Scores for Airbnb Listings") +
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent",colour = NA),
    plot.background = element_rect(fill = "transparent",colour = NA),
    plot.title = element_text(hjust=0.5)
  )

ggsave("assets/histogram.png", plot=p)
