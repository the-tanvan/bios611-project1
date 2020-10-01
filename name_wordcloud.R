library(tidyverse)
library(e1071)
library(mlbench)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(webshot)
library(htmlwidgets)

listings = read.csv("derived_data/listings.csv")

corpus = Corpus(VectorSource(listings$name))

#Conversion to Lowercase
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, tolower)

#Removing Punctuation
corpus = tm_map(corpus, removePunctuation)

#Remove stopwords (English and "avl")
corpus = tm_map(corpus, removeWords, c("avl", stopwords("english")))

# Eliminate white spaces
corpus = tm_map(corpus, stripWhitespace)

DTM = TermDocumentMatrix(corpus)
mat = as.matrix(DTM)
f = sort(rowSums(mat),decreasing=TRUE)
dat = data.frame(word = names(f),freq=f)

png("assets/name_wordcloud.png", width=12, height=8, units="in", res=300) 
set.seed(4)
wordcloud(words=dat$word, freq=dat$freq, min.freq=20, random.order=T, random.color=T,rot.per=.4,
          colors=c("#00A699","#484848","#FF5A5F","#FC642D","#767676"))
dev.off()

