derived_data/listings.csv: source_data/listings.csv tidy_data.R
	Rscript tidy_data.R

assets/reviews_dist.png: derived_data/listings.csv reviews_dist.R
	Rscript reviews_dist.R

assets/prices_plot.png: derived_data/listings.csv prices_plot.R
	Rscript prices_plot.R