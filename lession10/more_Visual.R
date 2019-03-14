## 부가적인 데이터 시각화

# 1) 패키지 불러오기
library(ggplot2)
library(corrplot)
library(treemap)

# 2) 만족도 점수시각화
satis<-data.frame(level=c("1. 매우 불만족","2. 불만족","3. 만족","5. 매우 만족"),score=c(-2,-1,1,2))
satis
ggplot(satis,aes(level,score,fill=score))+geom_bar(stat="identity")+scale_fill_gradient2()+ggtitle("만족도 점수")+theme_bw()

# 3) 상관분석
corr<-cor(USArrests)
par(mfrow=c(1,3))
corrplot(corr,tl.pos="n",cl.pos="n",title="circular",mar=c(4,0,4,0))
corrplot(corr,method="shade",addshade="positive",tl.pos="n",cl.pos="n",title="shade",mar=c(4,0,4,0))
corrplot(corr,method="number",tl.pos="n",cl.pos="n",title="numerical",mar=c(4,0,4,0))

# 4) 달력 시각화
stock <- "MSFT"; start.date <- "2006-01-12"; end.date <- Sys.Date()
quote <- paste("http://ichart.finance.yahoo.com/table.csv?s=",stock, "&a=", substr(start.date,6,7),"&b=", substr(start.date, 9, 10),
               "&c=", substr(start.date, 1,4),"&d=", substr(end.date,6,7),"&e=", substr(end.date, 9, 10),"&f=", substr(end.date, 1,4),
               "&g=d&ignore=.csv", sep="")    
stock.data <- read.csv(quote, as.is=TRUE)
stock.data <- transform(stock.data,week = as.POSIXlt(Date)$yday %/% 7 + 1,wday = as.POSIXlt(Date)$wday,year = as.POSIXlt(Date)$year + 1900)
test<-stock.data[1:475,]
ggplot(test, aes(week, wday, fill = Adj.Close)) +geom_tile(colour = "white") +scale_fill_gradientn('MSFT \n Adjusted Close',
colours = c("#D61818","#FFAE63","#FFFFBD","#B5E384"))+facet_wrap(~ year, ncol = 1)+theme_bw()

# 5) 트리맵 시각화
data("GNI2014")
treemap(GNI2014,index=c("continent", "iso3"),vSize="population",vColor="GNI",type="value")





