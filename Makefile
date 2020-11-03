.PHONY: rshiny/app.R

project1-writeup.pdf: project1-writeup.Rmd derived_data/listings.csv derived_data/analysis.csv derived_data/houses.csv derived_data/train.csv derived_data/test.csv
	R -e "rmarkdown::render('project1-writeup.Rmd',output_format='pdf_document')"

derived_data/amenities.csv: derived_data/listings.csv ds_amenities.py
	python ds_amenities.py

derived_data/analysis.csv: derived_data/listings.csv ds_analysis.R
	Rscript ds_analysis.R

derived_data/houses.csv: derived_data/listings.csv ds_houses.R
	Rscript ds_houses.R

derived_data/listings.csv: source_data/listings.csv ds_listings.R
	Rscript ds_listings.R

derived_data/train.csv: derived_data/analysis.csv ds_train_test.R
	Rscript ds_train_test.R

derived_data/test.csv: derived_data/analysis.csv ds_train_test.R
	Rscript ds_train_test.R

assets/prices_plot.png: derived_data/listings.csv plot_proposal_price.R
	Rscript plot_proposal_price.R

assets/reviews_dist.png: derived_data/listings.csv plot_proposal_price.R
	Rscript plot_proposal_price.R

rshiny/app.R: derived_data/listings.csv
		Rscript app.R ${PORT}