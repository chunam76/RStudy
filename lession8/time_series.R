## 시계열 분석 예측 

# 1) 데이터 불러오기

AirPassengers

# 2) 시계열 데이터 시각화
ts.plot(AirPassengers)
title("1949~1960년 월별 탑승 승객")

# 3) 시계열 분해
ts<-decompose(AirPassengers) # 데이터를 쪼개기
ts
plot(ts)

# 4) Arima 라는 시계열 분석결과 수행
fit <- arima(AirPassengers, order=c(1,0,0), list(order=c(2,1,0), period=12))

# 5) 향후 시계열 예측 수행 24개월치 분으로
predict <- predict(fit, n.ahead=24)

# 6)  visual
ts.plot(AirPassengers, predict$pred, col=c(1,2,4,4), lty = c(1,1,2,2))
legend("topleft", c("실제", "예측"), col=c(1,2), lty=c(1,1))
