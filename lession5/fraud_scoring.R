## 부정고객 점수계산

# 1) 데이터 불러오기
credit_data

# 2) 데이터 탐색
str(credit_data)
head(credit_data)
summary(credit_data)

# 3) 주거래 은행 변수를 factor 유형으로 변환 
credit_data$bank <-as.factor(credit_data$bank)
summary(credit_data)

# 3) 주거래 은행에 따른 보유 금액
aggregate(monetary~bank,data=credit_data,mean)
aggregate(monetary~credit_card,data=credit_data,mean)


# 4) 로지스틱 회귀분석 수행
model <- glm(fraud~bank+credit_card+monetary,data=credit_data,family="binomial")
summary(model)

# 5) 로지스틱 회귀분석으로부터 부정사용 의심 점수 계산 : 100을 곱한 것은 100점 만점으로 계산하기 위해....
score<-fitted(model)*100

# 6) cbind 함수를 사용해 기존 데이터에 부정사용 의심 점수를 결합
result<-cbind(credit_data,score)
result


library(ggplot2)

# 주거래은행에 따른 부정 사용의심점수 시각화
ggplot(result,aes(x=score,fill=bank))+
  geom_histogram(binwidth=0.6,alpha=0.5,position="identity")+
  ggtitle("주거래은행에 따른 고객의심 부정사용 의심 점수")+
  theme_bw()
