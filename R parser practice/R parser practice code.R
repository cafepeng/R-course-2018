# cf. https://blog.gtwang.org/r/r-xml-package-parsing-and-generating-xml-tutorial/
#ONLINE COURSE: https://hiskio.com/courses/74/lectures/1186
# cf. https://github.com/sulaxd/tmR/blob/master/TextMining.R


#try 台大獎學金網頁
#page 1 link: 
##http://love.ntu.edu.tw/CustomerSet/207_NTUactive/u_active_v1.asp?scholarship_skeyword=%E8%AB%8B%E8%BC%B8%E5%85%A5%E9%97%9C%E9%8D%B5%E5%AD%97&ssc_sat=&PageNo=1&id={6744E5C6-790F-420F-A4B8-07F425A5C771}
#page 2 link: 
##http://love.ntu.edu.tw/CustomerSet/207_NTUactive/u_active_v1.asp?scholarship_skeyword=%E8%AB%8B%E8%BC%B8%E5%85%A5%E9%97%9C%E9%8D%B5%E5%AD%97&ssc_sat=&PageNo=2&id={6744E5C6-790F-420F-A4B8-07F425A5C771}

#STEP 1-1 觀察到:
##url_head<-"http://love.ntu.edu.tw/CustomerSet/207_NTUactive/u_active_v1.asp?scholarship_skeyword=%E8%AB%8B%E8%BC%B8%E5%85%A5%E9%97%9C%E9%8D%B5%E5%AD%97&ssc_sat=&PageNo="
#page num.在這兩者之間
##url_tail<-"&id={6744E5C6-790F-420F-A4B8-07F425A5C771}"

#STEP 1-2 在網頁上抓取各個連結
#xpath 為: //td[@align="left"]/a/@href

#STEP 1-3 進入任一連結，確定內文的xpath
#xpath 為: //td[@align="left"]

#STEP 2-1: 進入R介面
library(RCurl)
library(XML)
library(httr)

#2-2 爬蟲程式
url_head<-"http://love.ntu.edu.tw/CustomerSet/207_NTUactive/u_active_v1.asp?scholarship_skeyword=%E8%AB%8B%E8%BC%B8%E5%85%A5%E9%97%9C%E9%8D%B5%E5%AD%97&ssc_sat=&PageNo="
url_tail<-"&id={6744E5C6-790F-420F-A4B8-07F425A5C771}"

#確定最上層的網頁之網址
allurl<-c()
for(n in 1:2){
  url<-paste0(url_head,n)
  url<-paste0(url,url_tail)
  allurl[n]<-url
}

#爬取各個上層網頁涵蓋的網址
#要先把html透過htmlParse轉成xml，因為xpath只能讀取xml
#1. 將各頁一覽表html原始碼，並存成temp變數
##temp<- getURL(allurl, .encoding = "UTF-8")
#2. 將html轉成xml
##xmldoc<- htmlParse(temp)
#3.選取超連結字串
##path<- xpathSApply(xmldoc,"//td[@align=\"left\"]/a//@href")
#觀察path，比照原始網址不完整，少了前面"http://love.ntu.edu.tw/CustomerSet/207_NTUactive/"這一段
##subpath<-"http://love.ntu.edu.tw/CustomerSet/207_NTUactive/"
##path<-paste0(path,subpath)

##因為最上層網頁有兩個，因此寫for 迴圈
##---------------2. 擷取網頁上所列出的各個網址-------------##
allurls<-c()
for (k in 1:2){
  temp<- getURL(allurl[k], encoding = "UTF-8")
  xmldoc<- htmlParse(temp)
  path<- xpathSApply(xmldoc,"//td[@align=\"left\"]/a//@href")
  subpath<-"http://love.ntu.edu.tw/CustomerSet/207_NTUactive/"
  urlist<-paste0(subpath,path)
  #key: 為了避免覆蓋資料，一定要加下面這行指令
  allurls<-c(urlist,allurls)
  
}

length(allurls)

##============= 3. 擷取各網址所含的文字===================##
# my way, but 'alltext' is just a combination of texts#
alltext<-c()
for (k in 1:length(allurls)){
  temp02<-getURL(allurls[k], .encoding="UTF-8") #註:encoding前面一定要加.不然是顯示亂碼
  xmldoc02<-htmlParse(temp02)
  #原始:path02<-xpathSApply(xmldoc02,"//td[@align="left"]",xmlValue)#
  path02<-xpathSApply(xmldoc02,"//td[@align=\"left\"]",xmlValue)
  alltext<-c(path02,alltext)
}

#try another way by using 'capture.output' function-- 不好用，反而增加無謂的贅詞#
alltext_try<-capture.output(
for (k in 1:length(allurls)){
  temp02<-getURL(allurls[k], .encoding="UTF-8") #註:encoding前面一定要加.不然是顯示亂碼
  xmldoc02<-htmlParse(temp02)
  #原始:path02<-xpathSApply(xmldoc02,"//td[@align="left"]",xmlValue)#
  path02<-xpathSApply(xmldoc02,"//td[@align=\"left\"]",xmlValue)
  print(path02)
}
)

##-------4. 清理其中的雜質----------------------------##
head(alltext,11)
alltext01<-gsub("\r","",alltext)
alltext01<-gsub("\n","",alltext01)
alltext01<-gsub(" ","",alltext01)

#由於每個頁面有11筆資料，所以每11筆循環一次#
#check the length of alltext01，總計220筆=2主頁*10筆(每頁)*11個項目(每筆)##
length(alltext01)

##--------------- 5.獎學金整理表-------------------##
#將資料存成20行、11欄的矩陣
alltable <- matrix(alltext01,20,11,byrow=TRUE)
#去除第一欄無用文字
#alltable <- alltable[,-1] 
#下列這個指令得到一樣結果
alltable01 <- alltable[,2:11] 

#設定欄位名稱
colnames(alltable01) <- c("類別名稱","申請日期","獎學金名稱","申請地點","附加檔案","獎學金金額","獎學金名額","申請對象","申請資格","繳交文件")
#匯成csv 檔
write.csv(alltable01,"ntu_table.csv")
