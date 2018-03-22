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