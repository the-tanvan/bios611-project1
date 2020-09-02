# Commands

This document serves as a reference for the various commands.

## Docker Commands

Run the following commands to set up docker image.

docker build . -t project1-env

docker run --rm -p 8787:8787 -e PASSWORD=hello -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio -t project1-env

## Git Commands

git status

git add [file]

git commit

Insert text by pressing i and typing comment. Escape and save by pressing Esc + :wq

git push

## Makefile Commands

make assets/histogram.png