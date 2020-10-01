# library(tidyverse)
# library(e1071)
# library(mlbench)
# library(tm)
# library(SnowballC)
# library("wordcloud")
# library("RColorBrewer")

# listings = read.csv("derived_data/listings.csv")

corpus = Corpus(VectorSource(listings$name))
# corpus[[1]][1]

#Conversion to Lowercase
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, tolower)

#Removing Punctuation
corpus = tm_map(corpus, removePunctuation)

#Remove stopwords
corpus = tm_map(corpus, removeWords, c("cloth", stopwords("english")))

# Stemming
# corpus = tm_map(corpus, stemDocument)

# Eliminate white spaces
corpus = tm_map(corpus, stripWhitespace)
# corpus[[1]][1] 

DTM = TermDocumentMatrix(corpus)
mat = as.matrix(DTM)
f = sort(rowSums(mat),decreasing=TRUE)
dat = data.frame(word = names(f),freq=f)
head(dat, 5)

set.seed(100)
p=wordcloud(words=dat$word, freq=dat$freq, min.freq=20, random.order=FALSE)

