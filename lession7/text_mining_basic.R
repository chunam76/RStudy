## 텍스트 데이터 분석

# 1) text mining 패키지 불러오기

library(tm)

# 2) Crude 데이터 불러오기

data("crude")
tdm <- TermDocumentMatrix(crude)
tdm

# 3) 단어 탐색
inspect(tdm)

# 4) 10회 이상 존재하는 단어만 출력
findFreqTerms(tdm,lowfreq=10)

# 5) oil 단어와 관련 높은 단어 출력
findAssocs(tdm,"oil",0.7)

# 6) 단어빈도 막대 그래프
freq <- sort(rowSums(as.matrix(tdm)), decreasing=TRUE)  
freq

wf <- data.frame(word=names(freq), freq=freq)   
wf

library(ggplot2)   
ggplot(subset(wf, freq>20), aes(word, freq))+ geom_bar(stat="identity")+ theme_bw()
