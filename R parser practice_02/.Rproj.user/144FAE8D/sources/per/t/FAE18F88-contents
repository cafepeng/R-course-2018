library(RCurl)
library(XML)
library(httr)

#檢查網頁
#https://www.ptt.cc/bbs/movie/index6600.html


#movie title's xpath: //div/a[@href]

#單純擷取某一頁標題
link<-getURL("https://www.ptt.cc/bbs/movie/index6600.html")
xml<-htmlParse(link)
title<-xpathSApply(xml,"//div/a[@href]",xmlValue)
title<-data.frame(title)

#擷取多頁標題6600-6610
urlhead<-"https://www.ptt.cc/bbs/movie/index"

#startpage=6600
#endpage=6610
for (k in 500:510){
     url<-paste(urlhead,k,".html",sep="")
     urlist<-c(url,urlist)
     }



