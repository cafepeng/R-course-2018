#install.packages("car")
library(car)
data01<-data.frame(Salaries)

#data source : https://www.rdocumentation.org/packages/car/versions/2.1-6/topics/Salaries
##The 2008-09 nine-month academic salary for Assistant Professors, Associate Professors and Professors in a college in the U.S. 
##The data were collected as part of the on-going effort of the college's administration to monitor salary differences between male and female faculty members.

#variable types:
## rank: a factor with levels-- AssocProf, AsstProf, Prof
##discipline:a factor with levels A (``theoretical'' departments) or B (``applied'' departments).
##yrs.since.phd: years since PhD
##yrs.service: years of service.
##sex: a factor with levels Female Male
##salary: nine-month salary, in dollars.


#basic info
str(data01)
dim(data01)
summary(data01)
summary(data01$rank)
summary(data01$salary)
summary(data01$sex)

#load the packages needed for data visualization
library(ggplot2)
library(dplyr)


#1.if income increases as the year of service increases? 
##note:alpha refers to the degree of transparancy so that the points would not block other points
pic1<-ggplot(data01)+geom_point(mapping=aes(x=yrs.service,y=salary),alpha=1/2,color="blue",size=5)
pic1
ggsave(filename="pic1.pdf",plot=pic1)

##Finding: as years of service increases, the salaries increase as well


#2.is there a difference in salaries between males and females overall?
## add another aesthetic measure "sex"
pic2<-ggplot(data01)+geom_point(mapping=aes(x=yrs.service,y=salary,color=sex),alpha=1/2,size=5)
pic2
ggsave(filename="pic2.pdf",plot=pic2)
## Findings: it seems that the salary range is relatively limited to females

#3_1. following Q2, is it possible that the difference btw males and females gets larger in higher income range(e.g. higher than Q3)?
pic3_1<-ggplot(data01)+geom_point(mapping=aes(x=yrs.service,y=salary>134185,color=sex),alpha=1/2,size=5)
pic3_1

ggsave(filename="pic3_1.pdf",plot=pic3_1)

##finding: due to the relative small sample of female, this picture is relatively meaningless

#3_2.Use facet setting to draw two diagrams that represents females and males seperately
pic3_2<-ggplot(data01)+geom_point(mapping=aes(x=yrs.service,y=salary),color="blue",alpha=1/2,size=5)+
         facet_wrap(~sex)
pic3_2
#save the pic by using "ggsave"
ggsave(filename="pic3_2.pdf", plot=pic3_2)

#4_1.Does the salary differs in terms of ranks?
pic4_1<-ggplot(data01,mapping=aes(x=yrs.service,y=salary))+
  geom_point(
      mapping=aes(color=rank),alpha=1/2,size=5)+
  geom_smooth(
      mapping=aes(color=rank))
pic4_1

ggsave(filename="pic4_1.pdf",plot=pic4_1)

##Finding: higher the rank, higher the variance in salaries



#take a closer look at the highest rank "professor" by plotting its line only
pic4_2<-ggplot(data01,mapping=aes(x=yrs.service,y=salary))+
  geom_point(
     mapping=aes(color=rank),alpha=1/2,size=5)+
  geom_smooth(
     data=filter(data01,rank=="Prof"),
     se=FALSE
     )
pic4_2

ggsave(filename="pic4_2.pdf",plot=pic4_2)

##Finding: higher the rank, highe the range in salaries