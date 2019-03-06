# 고객세분화 결과 시각화


# 1) rgl 패키지 불러오기
library(rgl)

# 2) 3d plot을 통한 RFM 지수 시각화
plot3d(customer_rfm$monetary, customer_rfm$frequency, customer_rfm$recency, 
       xlab = 'Monetray',ylab = 'Frequency',zlab = 'Recency',col="blue", size=6) 
