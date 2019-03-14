## 텍스트 데이터 분석과 워드 클라우드

# 1) 패키지 불러오기
library(rJava)
library(KoNLP)
library(wordcloud)
library(plyr)
library(twitteR)
library(tm)
library(RColorBrewer)
library(ROAuth)
library(ggplot2) 

# 2)트위터 계정 접속
api_key <- 'SwpBYqBJzlppAHx2glqSNH3lF'
api_secret <- 'sdiVYbQfLfJGoohJcnjDBwzAdNZo2gDus6QwbE7sfCDorcu6Xk'
access_token <- '151759080-fh6W9WWbnC13WjiIU7t8run2dspiWkEK0rknO2PA'
access_token_secret <- 'vP6YfOBdIZ7gullSo40PHFWvfTthr1onwnBJSwvbyrLQ9'
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# 3) 트럼프 관련 트윗 수집
keyword <- enc2utf8("#트럼프")
result <- searchTwitter(keyword, since='2016-10-01',lang="ko",n=10000)

# 4) 문자에 해당하는 부분만 추출
result.df <- twListToDF(result)
result.text <- result.df$text

# 5) 정제 작업
result.text <- gsub("\n", "", result.text)
result.text <- gsub("\r", "", result.text)
result.text <- gsub("RT", "", result.text)
result.text <- gsub("http", "", result.text)
result.text <- gsub("CO", "", result.text)
result.text <- gsub("co", "", result.text)
result.text <- gsub("ㅋㅋ", "", result.text)
result.text <- gsub("ㅋㅋㅋ", "", result.text)
result.text <- gsub("ㅋㅋㅋㅋ", "", result.text)
result.text <- gsub("ㅠㅠ", "", result.text)
result_nouns <- Map(extractNoun, result.text)
result_wordsvec <- unlist(result_nouns, use.name=F)
result_wordsvec <- result_wordsvec[-which(result_wordsvec %in% stopwords("english"))]
result_wordsvec <- gsub("[[:punct:]]","", result_wordsvec)
result_wordsvec <- Filter(function(x){nchar(x)>=2}, result_wordsvec)

# 문자 카운팅
result_wordcount <- table(result_wordsvec)

# 6) 기초 탐색과 워드 클라우드 생성

# 30개 상위 키워드
head(sort(result_wordcount,decreasing = T),30)

# 10개상위 키워드 원도표
top<-head(sort(result_wordcount,decreasing = T),30)[1:10]
pie(top,col=rainbow(10),radius=1,main="트럼프 관련 트윗 상위 10개")


# 워드 클라우드 생성
windowsFonts(malgun=windowsFont("Arial"))
wordcloud(names(result_wordcount), freq=result_wordcount,scale=c(5,1), 
          min.freq=5, random.order=F,colors=brewer.pal(8,"Set2"), rot.per=.25,random.color = T)

