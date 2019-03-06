## iris 데이터에서 변수 추출하기

#1) iris 데이터불러오기
# 우측 Environment에서 Import Dataset > From Local File을
# 선택해서 iris.txt 데이터를 불러주시면 됩니다.

#2) 데이터에서 컬럼을 추출하는 방법
iris$Sepal.Length

# ifelse 구문을 이용한 데이터 추가
y <- ifelse(iris$Sepal.Length > 5, "more than 5", "less than 5")

iris$Sepal.Length_level <- y

head(iris)

# 데이터의 통합(데이터 내의 특정변수를 기준으로 다른 특정 변수의 통계치를 산출하는 방법)
# aggregate(통계치를 산출할 연속형 값, ~ 통합을 수행할 기준 변수, 데이터, 사용할 통계함수)
# Species 별 Sepal.Length의 평균
aggregate(Sepal.Length ~ Species, data=iris, mean)

# Species 별 Sepal.Length 값의 합산
aggregate(Sepal.Length ~ Species, data=iris, sum)

# Species 별 모든 항목의 합산
aggregate(. ~ Species, data=iris, mean)