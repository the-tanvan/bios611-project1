FROM rocker/verse
MAINTAINER Jenna Tan <alyjen.tan@gmail.com>
RUN R -e "install.packages('cowplot')"
RUN R -e "install.packages('e1071')"
RUN R -e "install.packages('mlbench')"
RUN R -e "install.packages('tm')"
RUN R -e "install.packages('SnowballC')"
RUN R -e "install.packages('wordcloud')"
RUN R -e "install.packages('RColorBrewer')"
RUN R -e "install.packages('webshot')"
RUN R -e "install.packages('htmlwidgets')"
RUN R -e "install.packages('leaps')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('pROC')"
RUN R -e "install.packages('MLmetrics')"
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install numpy pandas sklearn plotnine matplotlib pandasql bokeh