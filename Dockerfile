FROM rocker/tidyverse
MAINTAINER Jenna Tan <alyjen.tan@gmail.com>
RUN R -e "install.packages('cowplot')"