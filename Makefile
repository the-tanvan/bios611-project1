
project1-writeup.pdf: project1-writeup.Rmd derived_data/listings.csv derived_data/analysis.csv derived_data/houses.csv derived_data/train.csv derived_data/test.csv
	R -e "rmarkdown::render('project1-writeup.Rmd',output_format='pdf_document')"

derived_data/amenities.csv: derived_data/listings.csv ds_amenities.py
	python3 ds_amenities.py

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

assets/pie_hottub.png: derived_data/amenities.csv plot_pie_hottub.py
	python3 plot_pie_hottub.py

assets/pie_ideal.png: derived_data/amenities.csv plot_pie_ideal.py
	python3 plot_pie_ideal.py

assets/pie_stove.png: derived_data/amenities.csv plot_stove_ideal.py
	python3 plot_stove_ideal.py

assets/pie_wifi.png: derived_data/amenities.csv plot_wifi_ideal.py
	python3 plot_wifi_ideal.py

assets/prices_plot.png: derived_data/listings.csv plot_proposal_price.R
	Rscript plot_proposal_price.R

assets/reviews_dist.png: derived_data/listings.csv plot_proposal_price.R
	Rscript plot_proposal_price.R

.PHONY: shiny_app
# Make target for Rshiny app of interactive histogram
shiny_app: derived_data/listings.csv rshiny/app.R
		Rscript rshiny/app.R ${PORT}