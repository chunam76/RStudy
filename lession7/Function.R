## 문자 데이터 다루기

# 1) 데이터 불러오기기, character 유형으로 변호
travel
head(travel)
str(travel)

travel$date<-as.character(travel$date)
travel$destination<-as.character(travel$destination)
str(travel)

# 2) nchar 함수를 사용한 문자값의 길이 계산 
travel$destination_length<-nchar(travel$destination)
head(travel)

# 3) substr 함수를 사용한 문자 추출
travel$year<-substr(travel$date, 1, 4)
head(travel)

travel$month<-substr(travel$date, 6, 7)
head(travel)

# 4) paste 함수를 사용한 문자 붙히기, sep: 두 문자 간의 들어갈 Text
travel$year<-paste(travel$year,"년도",sep="")
travel$month<-paste(travel$month,"월",sep="")
travel$date2<-paste(travel$year,travel$month,sep="")
head(travel)

# 5) gsub 함수를 사용한 문자 대체: month에 있는 0을 빈값으로 대체
travel$month<-gsub("0","",travel$month)
head(travel)
