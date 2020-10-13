# README

## What this project contains
This repository contains the data, code, and results of an analysis of Airbnbs in Asheville, North Carolina.

## Source data
This analysis is based on the listings dataset which was sourced from InsideAirbnb.com and was last updated on June 25, 2020. This dataset contains information on 2,407 different Airbnb listings in Asheville, North Carolina. Examples of included properties are superhost status, price, bedrooms, zipcode, and rating. In total, there are 106 points of data on each property. The motivation behind this analysis is that I am traveling to Asheville next spring for my honeymoon next year (May 2021) and I want to make sure that we are not getting over-charged for our booking!

If you wish to exactly replicate this analysis, please utilize the csvs located in the source_data folder of this repository. 

## How to build the docker image
Run the following commands to set up docker image. For the second command, insert your own unique password and change the path in the command to the project1 folder in your directory. Refer to Commands.md for more commands.

``docker build . -t project1-env``

``docker run --rm -p 8787:8787 -e PASSWORD=<insert your own unique password> -v <insert path to project1 folder>:/home/rstudio -t project1-env``

Example:

``docker run --rm -p 8787:8787 -e PASSWORD=hello -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio -t project1-env``

## How to construct the final result
To be added later.