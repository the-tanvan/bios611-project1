derived_data/listings.csv: source_data/listings.csv ds_listings.R
	Rscript ds_listings.R

derived_data/analysis.csv: derived_data/listings.csv ds_analysis.R
	Rscript ds_analysis.R

assets/reviews_dist.png: derived_data/listings.csv plot_proposal_price.R
	Rscript plot_proposal_price.R

assets/prices_plot.png: derived_data/listings.csv plot_proposal_price.R
	Rscript plot_proposal_price.R