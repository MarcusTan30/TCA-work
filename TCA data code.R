library(readxl)
library(nlme)
library(jtools)
library(kableExtra)
library(foreign)
library(nlme)
library(car)
library(ggplot2)
library(reshape2)


###actual used##
rm(list = ls())
setwd ("G:/My Drive/Application material/TCA/Labour data")
Data=read.csv("Energy employ by energy.csv",header=TRUE,skip=5)
colnames(Data)<-c('Date',2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)
Data1<-Data[c(2:8),]
  
Datam<-melt(data=Data1,id.vars=c('Date'),variable.name = 'Year')
Datam$'Employment level'<-as.numeric(gsub(",", "", Datam$value))
par(mfrow=c(1,1))
ggplot(Datam, aes(fill=Date, y=Datam$`Employment level` ,x=Year)) + 
  geom_bar(stat="identity",position='stack')+
  labs(title='Annual employment by industry')+
  xlab('Year')+
  ylab('Employment level')+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90))+
  scale_fill_manual(values=c('#003f5c','#374c80','#7a5195','#bc5090','#ef5675','#ff764a','#ffa600'))

 



