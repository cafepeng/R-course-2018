library(Rfacebook)
library(NLP)

library(tm)
library(RColorBrewer)
library(wordcloud)
#library(jiebaRD)
#library(jiebaR)

page.id<-"22092443056"
token<-"EAACEdEose0cBAJfDteCwPgpzALAfThhTGqRkA94p58WZCLtSwmth5cXGfn4OUfHa0TzHYa5Ea7sHCVtalqCfL9tpSv1btsfNe8YGpBFV8Tm5XMMqirj6hJ7aVUuQLIMowkeG6IpqINJm3n5JxWpC3JEijuqg93y1xfjye4JE6jH4v2LpHZAqYOEMOUDQnwfjPfZCIXF9wZDZD"
page<-getPage(page.id,token, n=300)

doc01<-Corpus(VectorSource(page$message))
inspect(doc01)

## Hope to delete unnecessary characters but failed

#doc02 <- gsub("[^0-9A-Za-z///' ]","'" , doc01 ,ignore.case = TRUE)
#x <- "a1~!@#$%^&*(){}_+:\"<>?,./;'[]-=" #or whatever
#str_replace_all(x, "[[:punct:]]", " ")



#要清洗掉的東西
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))

#定義清洗：清洗就是把你找到的符號用空白取代
#doc02<- tm_map(doc01, toSpace, "<U+00AF>")
doc02<- tm_map(doc01, toSpace, ">")
inspect(doc02[c(5:10)])

#doc02<- tm_map(doc02, toSpace, "<U+")
##problem at this command
###doc02<- tm_map(doc02, toSpace, "+")

doc02<- tm_map(doc02, toSpace, "#")
inspect(doc02[c(5:10)])

doc02<- tm_map(doc02, toSpace, "<U+00AF>")
doc02<- tm_map(doc02, toSpace, ">")
doc02<- tm_map(doc02, toSpace, "<U+")
doc02<- tm_map(doc02, toSpace, "#")
doc02<- tm_map(doc02, toSpace, "/")
doc02<- tm_map(doc02, toSpace, "@")


inspect(doc02[c(5:10)])


#remove punctuation and others
doc02<-tm_map(doc02,removePunctuation,ucp=TRUE)
doc02<-tm_map(doc02,removeNumbers)
doc02<-tm_map(doc02,stripWhitespace)
doc02<-tm_map(doc02,content_transformer(tolower))

inspect(doc02[c(1:10)])

  