# RFM 기반의 고객세분화 수행

# 1) 데이터 불러오기
# 우측 Environment에서 Import Dataset > From Local File을
# 선택해서 customer_rfm.txt 데이터를 불러주시면 됩니다.

customer_rfm
str(customer_rfm)
head(customer_rfm)

# 2) RFM 레벨 변수 각각을 통합하여 평균치 확인
aggregate(monetary ~ monetary_level, data = customer_rfm, mean)
aggregate(recency ~ recency_level, data = customer_rfm, mean)
aggregate(frequency ~ frequencey_level, data = customer_rfm, mean)

# 3) RFM 레벨 변수를 기준으로 모든 변수의 평균 계산
rfm_level<-aggregate(. ~ monetary_level+frequency_level+recency_level, data = customer_rfm, mean)
rfm_level


