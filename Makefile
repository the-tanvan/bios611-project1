derived_data/listings.csv: source_data/listings.csv ds_listings.R
	Rscript ds_listings.R

derived_data/analysis.csv: derived_data/listings.csv ds_analysis.R
	Rscript ds_analysis.R

assets/reviews_dist.png: derived_data/listings.csv reviews_dist.R
	Rscript reviews_dist.R

assets/prices_plot.png: derived_data/listings.csv prices_plot.R
	Rscript prices_plot.R