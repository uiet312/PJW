# csv 파일 불러오기
sub <- read.csv(file = "C:/RStudio/subway.csv", header = TRUE, ) # 2019년 1월 ~ 6월 데이터만 추출

# 필요한 데이터 추출
sub <- sub[,-c(6:25)]
sub <- sub[,-c(1,3)]
sub

sub1 = sub[sub$호선 ==  '1호선',]
sub2 = sub[sub$호선 ==  '2호선',]
sub3 = sub[sub$호선 ==  '3호선',]
sub4 = sub[sub$호선 ==  '4호선',]
sub5 = sub[sub$호선 ==  '5호선',]
sub6 = sub[sub$호선 ==  '6호선',]
sub7 = sub[sub$호선 ==  '7호선',]
sub8 = sub[sub$호선 ==  '8호선',]

sub11 <- sub1[sub1$구분 == '승차',]
sub12 <- sub1[sub1$구분 == '하차',]
sub21 <- sub2[sub1$구분 == '승차',]
sub22 <- sub2[sub1$구분 == '하차',]
sub31 <- sub3[sub1$구분 == '승차',]
sub32 <- sub3[sub1$구분 == '하차',]
sub41 <- sub4[sub1$구분 == '승차',]
sub42 <- sub4[sub1$구분 == '하차',]
sub51 <- sub5[sub1$구분 == '승차',]
sub52 <- sub5[sub1$구분 == '하차',]
sub61 <- sub6[sub1$구분 == '승차',]
sub62 <- sub6[sub1$구분 == '하차',]
sub71 <- sub7[sub1$구분 == '승차',]
sub72 <- sub7[sub1$구분 == '하차',]
sub81 <- sub8[sub1$구분 == '승차',]
sub82 <- sub8[sub1$구분 == '하차',]

# 호선별 승차수 하차수 
sum(sub11$합.계) # 1호선 승차수 합
sum(sub12$합.계) 
sum(sub21$합.계)
sum(sub22$합.계)
sum(sub31$합.계)
sum(sub32$합.계)
sum(sub41$합.계)
sum(sub42$합.계)
sum(sub51$합.계)
sum(sub52$합.계)
sum(sub61$합.계)
sum(sub62$합.계)
sum(sub71$합.계)
sum(sub72$합.계)
sum(sub81$합.계)
sum(sub82$합.계)

# 데이터 시각화
options(scipen=100) # 지수표기를 숫자표기로 변환

일호선 <- c(sum(sub11$합.계),sum(sub12$합.계))
이호선 <- c(sum(sub21$합.계),sum(sub22$합.계))
삼호선 <- c(sum(sub31$합.계),sum(sub32$합.계))
사호선 <- c(sum(sub41$합.계),sum(sub42$합.계))
오호선 <- c(sum(sub51$합.계),sum(sub52$합.계))
육호선 <- c(sum(sub61$합.계),sum(sub62$합.계))
칠호선 <- c(sum(sub71$합.계),sum(sub72$합.계))
팔호선 <- c(sum(sub81$합.계),sum(sub82$합.계))

df <- data.frame(일호선,이호선,삼호선,사호선,오호선,육호선,칠호선,팔호선)
df

barplot(as.matrix(df),main="호선별 지하철 이용량",ylab="a",beside=T,col=c("blue","red"))
legend("topright",c("승차수","하차수"),cex=0.8,fill=c("blue","red"))
