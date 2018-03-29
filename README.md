# R-course-2018 NTU course
## syntax in GitHub readme: 
> https://help.github.com/articles/basic-writing-and-formatting-syntax/#headings
> https://github.com/emn178/markdown#this-is-an-h1

week 1

week 2


# week 3 data visualization
## 1. ggplot2 package: 
### command in general: ggplot("data")+geom_point(mapping=aes(x= , y= )) + geom_smooth(mapping=aes((x= , y= )) 
## 2. dplyr package:
### this package need to be installed if 'filter' function is needed
## 3. RMarkdown: text-formatting is challanging but this website is helpful 
### https://support.zendesk.com/hc/en-us/articles/203691016-Formatting-text-with-Markdown#topic_xqx_mvc_43__row_tf4_bmn_1n
## 4. Note on homework:
### use the dataset 'Salaries' in 'car'package
### once the package is required, we can directly use the dataset
#### (e.g.)
#### >library(car)
#### >str(Salaries)

> 成果: https://cafepeng.github.io/R-course-2018/hw_3/hw_3.html
### in R-Course 2018, settings ,branch , a link would pop up, just further specify the link (e.g. R...)

# Week 4 data visualization and API developer
## topic: 傳統爬蟲不是唯一的蒐集粗資料的方法，API developer則是另一個系統式的批次蒐集
## 1. 以facebook developer來說，關鍵是取得token (僅兩小時)，此外，Rfacebook ()是最好用的。
### Rfacebook()的好處，(a) 直接將資料存成data.frame, (b) 可以指定要爬取多少項回覆 
### 麻煩的地方，就是清理雜質(亂碼、空白、表情符號); 尚未學會處理表情符號 
### 表情符號清理: 
> https://stackoverflow.com/questions/24672834/how-do-i-remove-emoji-from-string/29115920
