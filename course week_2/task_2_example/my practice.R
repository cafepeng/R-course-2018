
##----------------------------------##
library(rvest)
#輸入網址，爬取此網頁
title<-read_html("http://news.ltn.com.tw/list/newspaper/world/20180313")
#標題內含css
title<-html_nodes(title,".tit p")
title<-html_text(title)
title<-html_nodes(title,"UTF-8")

#若文字出現亂碼，將格式改為可辨識的形式
title<-iconv(title,"UTF-8")

