## chap 1 in "R for data science"
#install.packages("tidyverse")

#problems solved: cf.https://stackoverflow.com/questions/31717850/error-package-or-namespace-load-failed-for-ggplot2-and-for-data-table
##errors shown after installation of tidyverse and ggplot
##soluation: (1)update the R version to the latest R3.4.4
##(2)remove the initial instation: remove.packages("ggplot2") 
##(3)reinstall it again: install.packages("ggplot2",dependencies=TRUE)


library(tidyverse)
library(ggplot2)
mpg01<-data.frame(mpg)
head(mpg)
dim(mpg)
head(mpg)

##---- examples from book: R for data science (p3~)----##
## use displ as x axis, hwy as y axis, adjust the plot points with color by 'class', and plot size by 'year'
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy,color=class,size=year))

## alpha controls the transparancy
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy,alpha=class,size=year))
##shape controls the shape of points
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy,shape=class))

## add aesthetic manually -- add a argument outside the aes()
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy),color="blue",size=4,shape=15)
                    
## add conditional argument in aes(),which specifies the cars 'before 2000'(TRUE) and 'after 2000'(FALSE)
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy,color=year<2000),size=4,shape=15)

## facet for 1 categorical variable
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2)
## facet for 2 categorical variables                            
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy))+facet_grid(drv~cyl)


#-----geometric objects------##
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy))

#smoothing conditional means: geom_smooth#
ggplot(data=mpg01)+geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv))
#geom_smooth with raw data points & conditional mean areas#
ggplot(data=mpg01)+geom_point(mapping=aes(x=displ,y=hwy,color=drv))+geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv))

##global setting: the above one is equivalent to the following one##
ggplot(data=mpg01,mapping=aes(x=displ,y=hwy))+geom_point(mapping=aes(color=drv))+geom_smooth(mapping=aes(linetype=drv))

## global setting with local difference in geom: cf p.20##
library(dplyr)
ggplot(data=mpg01,mapping=aes(x=displ,y=hwy))+geom_point(mapping=aes(color=class))+geom_smooth(data=filter(mpg01,class=="subcompact"),se=FALSE)


