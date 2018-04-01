text<-c("Because I could not stop for Death -",
        "He kindly stopped for me -",
        "The Carriage held but just Ourselves -",
        "and Immortality")
text
class(text)

library(dplyr)
#note: have to add"stringsAsFactors=FALSE",不然的話，會將character視為factor
text_df<-data.frame(line=1:4,text=text,stringsAsFactors=FALSE)
class(text_df)
class(text_df$text)


#install package tidytext
#install.packages("tidytext",dependencies = TRUE)
library(tidytext)

#need to run %>% so read "ggplot2"
#install.packages("magrittr",dependencies = TRUE)
library(magrittr)
library(ggplot2)

token<-text_df %>% 
  unnest_tokens(word, text)
#same as above
#unnest_tokens(text_df,word,text)


##2. Jane austen example----------##
library(janeaustenr)
library(dplyr)
library(stringr)

origin_book<-austen_books() %>%
  group_by(book) %>%
  mutate(linenumber=row_number(),
         chapter=cumsum(str_detect(text,regex("^chapter [\\divxlc]",ignore_case=TRUE))))%>%
  ungroup()
#tokenization: seperate sentences into words
library(tidytext)
tidy_books<-origin_book %>%
  unnest_tokens(word,text)

#remove the stopwords
data(stop_words)
tidy_books<-tidy_books %>% anti_join(stop_words,by=c("word"="word"))
#tidy_books<-anti_join(stop_words,by=c("word"="word"))

#count the most common words
tidy_books %>% 
  count(word,sort=TRUE)

#Plot 
library(ggplot2)
tidy_books %>% 
  count(word,sort=TRUE) %>%
  filter(n > 600) %>%
  mutate(word=reorder(word,n)) %>%
  ggplot(aes(word, n))+
  geom_col()+
  xlab(NULL)+
  coord_flip()


#wordcloud
library(wordcloud)
