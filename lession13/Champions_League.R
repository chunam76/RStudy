## 데이터 통합과 병합 응용
## 제공 데이터: 16 시즌 경기 기록 상세, 15 시즌 득점, 2016 발롱도르 수상 후보, 2016 유로 입상 국가

# 1) 데이터 불러오기 및 탐색
str(CL_16)
CL_16

# 2) 2016 발롱도르 수상 후보의 16 시즌 득점 기록
Award
# 데이터 통합(Player를 기준으로 Goals을 sum 해서 보여준다)
player_sum_16 <- aggregate(Goals ~ Player, data=CL_16, sum)

# 데이터 부분 외부 병합(기준을 Award 테이블에 맞춘다)
merge(player_sum_16, Award, by="Player", all.y=T)

# 3) 2016 유로 대회에서 입상한 국가에 속한 선수들의 16 시즌 득점 기록
Euro
merge(Euro, Award, by="Player", all.y=T)
national_sum_16 <- aggregate(Goals ~ Nationality, data=CL_16, sum)
merge(national_sum_16, Euro, by="Nationality", all.y=T)

# 4) 15, 16 시즌에 모두 골을 기록한 선수
player_sum_15 <- CL_15
player_sum_16
merge(player_sum_15, player_sum_16, by="Player")
