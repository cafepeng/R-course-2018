#--------------TRY AGAIN, collect posts only----------------#

library(httr)
token="EAACEdEose0cBAEW6jTIuizxW7qMx8qQoMiMhLRmO3hwzWzUfgrqjldK0ZAuNWN8gkfQZBVuviTfq9AgrCkhztDyNalABKu2gdH9kXcLFFdJAQ9AW2cDriTwJunGogfhj06ZCZBXZBft0rZAS5XKsKZBTE5lJKPa66EvBU65AsYq56t7hMOj9BjNP7TN7cPi0HLLQT7kEYJhhwZDZD"
prefex ="https://graph.facebook.com/v2.12/22092443056?fields=posts%7Bmessage%7D&access_token="
url = paste0(prefex, token)
res = httr::GET(url)
posts = content(res)

posts02= posts$posts$data
#notice that the 6th and 7th only have id but not message
posts03= posts02[-c(6,7)]
class(posts03)

##try to convert list (post03) into dataframe, but the following command will show a single row of dataset
#posts04= data.frame(posts03)

##save as matrix first
#post04<-matrix(posts03,byrow=FALSE,ncol=2) #not working


##this one works, that is> unlist() list post03>convert it into matrix given 23 messages (so nrow=23)
#>then convert into dataframe
#cf. https://stackoverflow.com/questions/4227223/r-list-to-data-frame
posts04 <- data.frame(matrix(unlist(posts03), nrow=23, byrow=T))

colnames(posts04) <- c("message","id")
class(posts04)
posts05<-data.frame(posts04[,1])


#stack the data every two columns
#require(stats)
#posts05<-stack(posts04)                    # now put it back together
#posts05<-stack(posts04, select = -"id")    # omitting one vector

##--------------word cloud------------##
library(NLP)
library(tm)
library(jiebaRD)
library(jiebaR)
library(RColorBrewer)
library(wordcloud)

#first convert dataframe into VectorSource
posts06 <- Corpus(VectorSource(posts05))

posts06 <- tm_map(posts06, removePunctuation)
posts06 <- tm_map(posts06, removeNumbers)
posts06 <- tm_map(posts06, stripWhitespace)



