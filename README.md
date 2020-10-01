# README

## What this project contains
This repository contains the data, code, and results of an analysis of Airbnbs in Asheville, North Carolina.

## Source data
This data was sourced from insideairbnb.com in September 2020. If you wish to exactly replicate this analysis, please utilize the csvs located in the source_data folder of this repository.

## How to build the docker image
Run the following commands to set up docker image.

``docker build . -t project1-env``

``docker run --rm -p 8787:8787 -e PASSWORD=hello -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio -t project1-env``

## How to construct the final result

To be added later.