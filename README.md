# README

## What does this project contain?
This repository contains the data, code, and results of an analysis of Airbnbs in Asheville, North Carolina. The motivation behind this analysis is I will be traveling to Asheville next spring for my honeymoon and I want to make sure that we are not getting over-charged for our booking!

I also included a Rshiny app that allows users to explore the distributions of price by property type which was an important predictor in my model. Due to the vast number of property types, it's easier to allow users to select which histogram they would like to see as opposed to having pages and pages of the histograms in my writeup.

## What is the source data?
This analysis is based on the listings dataset which was sourced from InsideAirbnb.com and was last updated on June 25, 2020. This dataset contains information on 2,407 different Airbnb listings in Asheville, North Carolina. Examples of included properties are superhost status, price, bedrooms, zipcode, and rating. In total, there are 106 points of data on each property. 

If you wish to replicate this exact analysis, please utilize the csvs located in the source_data folder of this repository. 

## How do I build the docker image?
Run the following commands to set up a docker image. Note for the second command, you should insert your own unique password and change the path in the command to the project1 folder in your directory. Refer to Commands.md for more commands.

Command to build docker image: 

``docker build . -t project1-env``

Command to run docker image (RStudio):

``docker run --rm -p 8787:8787 -p 8788:8788 -e PASSWORD=<insert your own unique password> -v <insert path to project1 folder>:/home/rstudio -t project1-env``

Command to run docker image (Python/Jupyter Lab):

``docker run -p 8787:8787 -v <insert your directory>:/home/rstudio -it project1-env sudo -H -u rstudio bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8787"``

Example:

``docker run --rm -p 8787:8787 -p 8788:8788 -e PASSWORD=hello -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio -t project1-env``

``docker run -p 8787:8787 -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio -it project1-env sudo -H -u rstudio bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8787"``

## How do I construct the project writeup?
To create the project1-writeup pdf, run the following commands in your R terminal.

make derived_data/listings.csv

make derived_data/analysis.csv

make derived_data/houses.csv

make derived_data/train.csv

make derived_data/test.csv

R -e "rmarkdown::render('project1-writeup.Rmd',output_format='pdf_document')"

These commands will create the relevant datasets and the final pdf with the analysis.

## How do I construct the Rshiny app?

Run the following command in your rstudio terminal to run the rshiny app.

``PORT=8788 make shiny_app``

Open a new tab in your browser to http:/localhost:8788 and the app will be available to interact with.