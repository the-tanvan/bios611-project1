FROM rocker/tidyverse
MAINTAINER Jenna Tan <alyjen.tan@gmail.com>
RUN R -e "install.packages('cowplot')"
RUN R -e "install.packages('e1071')"
RUN R -e "install.packages('mlbench')"
RUN R -e "install.packages('tm')"
RUN R -e "install.packages('SnowballC')"
RUN R -e "install.packages('wordcloud')"
RUN R -e "install.packages('RColorBrewer')"