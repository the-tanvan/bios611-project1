# Commands

This document serves as a reference for the various commands.

## Docker Commands

Run the following commands to set up docker image.

docker build . -t project1-env

docker run --rm -p 8787:8787 -e PASSWORD=hello -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio -t project1-env

docker run -p 8787:8787 -v C:/Users/ajtan/Dropbox/2020\ Fall/BIOS\ 611/project1:/home/rstudio -it project1-env sudo -H -u rstudio bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8787"

Run the following commands to kill a docker container.

docker ps

docker kill <insert container id here>

## Logging into RStudio
1. Navigate your internet browser to http://localhost:8787/
1. Username: rstudio Password: hello

## Git Commands

git status

git add [file]

git commit

Insert text by pressing i and typing comment. Escape and save by pressing Esc + :wq

Alternative

git commit -m "Write your comment in here"

git push

## Makefile Commands

Enter the following command into the terminal of RStudio.

make assets/histogram.png