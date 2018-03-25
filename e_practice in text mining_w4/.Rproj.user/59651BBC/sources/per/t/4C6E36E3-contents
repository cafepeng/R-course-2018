##learn from datacamp (text mining Bag of Words)

#need package qdap
#install.packages("qdap")
library(qdap)


new_Text<-"DataCamp is the first online learning platform that focuses on building the best learning experience specifically for Data Science. We have offices in Boston and Belgium and to date, we trained over 250,000 (aspiring) data scientists in over 150 countries. These data science enthusiasts completed more than 9 million exercises. You can take free beginner courses, or subscribe for $25/month to get access to all premium courses"
new_Text2<-read.csv(new_Text)
#check is it is classified as character
class(new_Text2)

#count the frequency of words
require(qdap)
term_count<-freq_terms(new_Text2,1)


##---parsing from tweet of starbucks-----------##
library(rvest)
#輸入網址，爬取此網頁
title<-read_html("https://mobile.twitter.com/starbucks")
#標題內含css
title<-html_nodes(title,".dir-ltr")
title<-html_text(title)
title<-list(title)
str(title)

##------------------------------------------##

#practice on datacamp#
##1ST TRY##
# Create the object: text
text<-"<b>She</b> woke up at       6 A.M. It\'s so early!  She was only 10% awake and began drinking coffee in front of her computer."

library(tm)
library(qdap)
# All lowercase
text<-tolower(text)
text
# Remove punctuation
text<-removePunctuation(text)
text
# Remove numbers
text<-removeNumbers(text)
text
# Remove whitespace
text<-stripWhitespace(text)
text

##2ND TRY##
# Create the object: text
library(tm)
library(qdap)
text00<-list("<b>She</b> woke up at       6 A.M. It\'s so early!  She was only 10% awake and began drinking coffee in front of her computer.")
class(text)
text01<-VectorSource(text00)
text02<-VCorpus(text01)

# All lowercase
text02<-tm_map(text02,content_transformer(tolower))
text02
# Remove punctuation
text02<-tm_map(text02,removePunctuation)
text02
# Remove numbers
text02<-tm_map(text02,removeNumbers)
text02
# Remove whitespace
text02<-tm_map(text02,stripWhitespace)
text02


#=====RIGHT ANSWER TO ABOVE=============#
# Create the object: text
text <- "<b>She</b> woke up at       6 A.M. It\'s so early!  She was only 10% awake and began drinking coffee in front of her computer."

# All lowercase
tolower(text)

# Remove punctuation
removePunctuation(text)

# Remove numbers
removeNumbers(text)

# Remove whitespace
stripWhitespace(text)


