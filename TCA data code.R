library(readxl)
library(nlme)
library(jtools)
library(kableExtra)
library(foreign)
library(nlme)
library(car)
library(ggplot2)
library(reshape2)
##Data Cleaning phase###

#Data import
rm(list = ls())
setwd ("G:/My Drive/Application material/TCA/Labour data")
Data=read.csv("Energy employ by energy.csv",header=TRUE,skip=5)

#changing column names
colnames(Data)<-c('Date',2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)
Data1<-Data[c(2:8),]
#Data melting from wide to long for stacked barplotting
Datam<-melt(data=Data1,id.vars=c('Date'),variable.name = 'Year')
#converting string values into integers and removing the thousandth comma separator
Datam$'Employment level'<-as.numeric(gsub(",", "", Datam$value))

##Plotting and customization##
par(mfrow=c(1,1))
ggplot(Datam, aes(fill=Date, y=Datam$`Employment level` ,x=Year)) + 
  geom_bar(stat="identity",position='stack')+
  labs(title='Annual employment by energy industry')+
  xlab('Year')+
  ylab('Employment level')+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90))+
  scale_fill_manual(values=c('#003f5c','#374c80','#7a5195','#bc5090','#ef5675','#ff764a','#ffa600'))

#Thanks for looking through my code, i can also do more advanced econometric regressions as well(RD, interrupted TS, Time-series,Panel data etc), however to do so 
#would require the proper dataset (which requires proper samplesize) to perform properly.
#I hence chose a more basic work to showcase certain proper fundamentals.


