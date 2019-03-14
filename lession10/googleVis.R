## 구글 API 차트 시각화

# 1) 패키지 불러오기
library(googleVis)

# 2) 데이터 생성
example<-data.frame(country=c("GROUP A","GROUP B","GROUP C"),X=c(20,10,6),Y=c(13,8,20))

# 2) 선도표
Line <- gvisLineChart(example)
plot(Line)

# 3) 막대도표
Bar <- gvisColumnChart(example)
plot(Bar)

# 4) 상자도표
Box <- gvisCandlestickChart(OpenClose, options=list(legend='none'))
plot(Box)

# 5) 원도표
Pie <- gvisPieChart(CityPopularity)
plot(Pie)


# 6) 게이지 차트
Gauge <-  gvisGauge(CityPopularity,options=list(min=0, max=800, greenFrom=500,
                                                greenTo=800, yellowFrom=300, yellowTo=500,
                                                redFrom=0, redTo=300, width=400, height=300))
plot(Gauge)


# 7) 버블 차트
Bubble <- gvisBubbleChart(Fruits, idvar="Fruit",xvar="Sales", yvar="Expenses",
                          colorvar="Year", sizevar="Profit",options=list(hAxis='{minValue:75, maxValue:125}'))
plot(Bubble)


# 8) 모션 차트
Motion=gvisMotionChart(Fruits,idvar="Fruit",timevar="Year")
plot(Motion)
