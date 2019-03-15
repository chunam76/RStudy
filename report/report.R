# 1. iris 데이터의 Species를 기준변수로 Sepal.Length의 평균과 합계를 계산
mean(iris$Sepal.Length)
sum(iris$Sepal.Length)

# 2. nationality, gender 데이터를 불러와 두 데이터를 아래 조건의 4가지 방법으로 병합
# 내부 병합
merge(gender, nationality, id="id")

# 부분 외부 병합(국적 기준)
merge(gender, nationality, id="id", all.y=T)

# 부분 외부 병합(성별 기준)
merge(gender, nationality, id="id", all.x=T)

# 전체 외부 병합
merge(gender, nationality, id="id", all=T)
