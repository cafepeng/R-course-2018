##https://developers.facebook.com/tools/explorer/145634995501895/?method=GET&path=MaYingjeou%2F%3Ffields%3Dposts&version=v2.12
#https://developers.facebook.com/docs/graph-api/using-graph-api/#fieldexpansion

library(httr)

temp = list()

for( c in 1:3 )
{
  token  = "EAACEdEose0cBANKoUwZARoVNnQYiO6nGHKpsrQqLqetXY5Uxb62X0r5NDYJy6acWBspGAJTtZBLtahLqfMFTTmCZBX1miZAnNRwLZBmZBMdCTk8Q1ECI8ShQYKQhtcEkw7wRFkJxrDxCOu6edAw6iZAeJ79irKmIDGE95YcrOGCjMlWPdj0XCOq3jAgLhFyDGZBjot2FJnIRZAAZDZD"
  ##the end of the facebook APC, 取得代碼，cURL取得代碼，cURL
  prefex = "https://graph.facebook.com/v2.12/MaYingjeou/?fields=posts&access_token="
  url    = paste0(prefex, token)
  res    = httr::GET(url)
  posts  = content(res)
  #add temp
  temp = append(temp, posts)
  #add next page
  url = posts$posts$paging$`next`
}


res = POST("https://graph.facebook.com/v2.12/me/feed",
           body=list(message=sprintf("[TEST Posting Message] %s At %s","httr 測試",Sys.time()),
                     access_token=token))
postId = content(res)$id


url = sprintf("https://graph.facebook.com/v2.12/%s?access_token=%s", postId, token)
res = DELETE(url)
content(res)


## try facebook of Starbucks##

library(httr)

token  = "EAACEdEose0cBAM0kxkcru6IpXZAyT1VshJm40KZCS2OhSxypNlsN0dyVtE3AfEAWEYINIozUgh4z44I1GGTW9TmYiD532WWiV8Sv5Ad72F4Ss2jZAgki4WZBjiqolidIZCPZBTYvxltB2Mytqn6kFbeVneFE6Tpzmo8TaW0zAxEuThZA0SBYUooa7arCWh1TGUZD"
##the end of the facebook APC, 取得代碼，cURL取得代碼，cURL
prefex = "https://graph.facebook.com/v2.12/Starbucks?fields=posts%2Clikes&access_token="
url    = paste0(prefex, token)
res    = httr::GET(url)
posts  = content(res)

message= posts$posts
message2= posts$posts$data
#message3 不可行是因為不是每個post都有message
#message3= message2$message
#因此可以查看，例如:message3=message2[[15]]$message

library(tm)
#note: tm_map only works on Vcorpus types of data
v_message2<-VectorSource(message2)
c_message2<-VCorpus(v_message2)
message3<-tm_map(c_message2,removeNumbers)
message3<-tm_map(message3,removePunctuation)
#message3<-tm_map(message3,content_transformer(tolower))
#message3<-tolower(message3)

message4<-message3$content




##Try another method##
message2_update<-unlist(message2)
message2_up02<-removePunctuation(message2_update)
message2_up02<-removeNumbers(message2_up02)
message2_up02<-stripWhitespace(message2_up02)
message2_up02<-gsub("T","",message2_up02)
#remove graph
#message2_up02<-gsub("[:graph:]","",message2_up02)

#remove new lines
#message2_up02<-gsub("\\n","",message2_up02)
#remove tabs
#message2_up02<-gsub("\\t","",message2_up02)

## Try again, try to pick the data and convert to dataframe in the beginning##
#check the class of posts, which is list
class(posts)
#covert list into dataframe by using rbind, which is now a matrix
posts2<-do.call(rbind,posts)
class(posts2)

#convert into a dataframe
posts3<-data.frame(posts2)
#or posts3<-data.frame(do.call(rbind,posts)) also works

#in posts 3, which is two-row and three-column, only need the first row and first column
posts4_v<-posts3[1,1]
#the class of posts4_v is again a list, convert it into a dataframe
posts4_v<-data.frame(posts3[1,1],sep=",")

#the columns of posts4_v is now upto 80,which includes id, messages and time but the some has messages, some not
#therefore, need to select the columne specifying "posts_message", including posts_message_1, posts_message_2 up to posts_message_24
##cf. https://stackoverflow.com/questions/18587334/subset-data-to-contain-only-columns-whose-names-match-a-condition
#require(dplyr)
#posts_4_df <- posts4_v %>% dplyr:: select(starts_with("posts_message_"))
#posts_4_df <- posts4_v %>% dplyr:: select(grep("posts_message", names(posts_4_v)))

posts_4_df<-posts4_v["posts_message*",]

