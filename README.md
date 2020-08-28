Marriage Analytics
=================

This is the readme.md for BIOS 611: Project 1.

Run the following commands to set up docker image.

docker build . -t project1-env

docker run --rm -p 8787:8787 -e PASSWORD=hello -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio/project1 -t project1-env

Run the following commands in R to set up data
setwd("./project1/source_data")

test=read.csv("./both_sexes.txt")