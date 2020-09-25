setwd("C:/RStudio")
library(ggplot2)
library(ggmap)
library(readxl)

aa <- read.csv("202003seoul.csv", head = TRUE)
aa <- aa[aa$시군구명 == '강동구',]
aa

columns <- c( "상가업소번호", "상호명", "상권업종대분류명", "상권업종중분류명", 
              "상권업종소분류명", "시군구명", "행정동명", "경도", "위도")

#register_google(key='API 키 입력')

cen <- c(mean(aa$경도),mean(aa$위도))
cen
map <- get_googlemap(center=cen,                # 마커 없는 지도 가져오기
                     maptype="roadmap",
                     size=c(640,640),
                     zoom=14)
gmap <- ggmap(map)                              # 지도를 저장
gmap+geom_point(data = aa, 
                aes(x=경도,y=위도,color=상권업종대분류명),size=2,alpha=0.7) +
  labs(x = "Longitude", y = "Latitude",
       title="강동구 업종별 점포", color = "업종")

# 커피 점포만 지도에 표시 
aa <- subset(aa, aa$상권업종소분류명== 
                    "커피전문점/카페/다방")
gmap+geom_point(data = aa, 
                aes(x=경도,y=위도), size=2, alpha=0.5, col="red") +
  labs(x = "Longitude", y = "Latitude",
       title="강동구 커피점" )

