## 지도 시각화

# 1) 패키지 불러오기
library(googleVis)

# 2) 지역별 시각화  
require(datasets)
states <- data.frame(state.name, state.x77)
GeoStates <- gvisGeoChart(states, "state.name", "Income",
                          options=list(region="US",displayMode="regions",resolution="provinces",width=600, height=400))
plot(GeoStates)

# 3) 경로 시각화
GeoMarker <- gvisGeoChart(Andrew, "LatLong",sizevar='Speed_kt',colorvar="Pressure_mb",options=list(region="US"))
plot(GeoMarker)


# 4) 경로 시각화 (그굴 맵)
AndrewMap <- gvisMap(Andrew, "LatLong" , "Tip", options=list(showTip=TRUE,howLine=TRUE, 
                                  enableScrollWheel=TRUE,mapType='terrain',useMapTypeControl=TRUE))
plot(AndrewMap)
