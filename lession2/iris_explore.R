library(ggplot2)

# iris 데이터 탐색
# 1) 데이터 불러오기
# 우측 Environment에서 Import Dataset > From Local File을
# 선택해서 iris.txt 데이터를 불러주시면 됩니다.
iris <- read.csv("E:/Study/R/RStudy/lession2/iris.txt", sep="")

# 2) 데이터 구조 확인
str(iris)

# 3) 상위 6개 케이스 확인
head(iris)

# 4) 기술통계 산출
summary(iris)

# 5) ggplot을 활용한 iris 데이터 시각화

ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(colour = Species, size=Petal.Width), alpha=I(0.7))+theme_bw()




