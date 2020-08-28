Marriage Analytics
=================

This is the readme.md for BIOS 611: Project 1.

Run the following commands to set up docker image.

docker build . -t project1-env

docker run --rm -p 8787:8787 -e PASSWORD=hello -t project1-env