setwd('C:/Rworks')


#### 02 R 스튜디오

install.packages('ggplot2')
library(ggplot2)

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point()



install.packages('cowsay')
library(cowsay)

say('Hello world!', by='cat')
say('좋은 아침', by = 'snowman')
say('hi', by = 'rabbit')


?sort


ceiling(2.4) # 소수점 올림해주는 함수
?ceiling


Sys.time()



#### 03 변수, 벡터, 함수 알아보기


a <- 10
x <- c(1:5)
k = a + x
print(k)



# 소금물의 농도 구하기
salt <- 50
water <- 100
result <- salt/(salt + water)*100
cat("소금 = ", salt, ", 물 = ", water, " : 농도 = ", result, "%")


salt <- 70
water <- 110
result <- salt/(salt + water)*100
cat("소금 = ", salt, ", 물 = ", water, " : 농도 = ", result, "%")


score <- c(68, 95, 83, 76, 90, 80, 85, 91, 82, 70)
mean(score) 


v1 <- c(1, 2, 5, 50:60)
v1

v2 <- seq(1, 100, 3) # 일정한 간격으로 증가
v2

v3 <- rep(1, times=5) # 반복
v3

v4 <- rep(1:3, times=3)
v4


# 벡터의 값에 이름 붙이기
absent <- c(8, 2, 0, 4, 1)
names(absent) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')

absent
names(absent)

absent[c('Mon', 'Tue')] # 이름으로 값 출력



# 적금 만기 금액 계산하기

customer <- c('kim', 'lee', 'park', 'choi', 'seo')
deposit <- c(5000000, 4500000, 4000000, 5500000, 6000000)
rate <- c(3.5, 3, 4, 5, 4.5)
period <- c(2, 2, 5, 7, 4)

names(deposit) <- customer
names(rate) <- customer
names(period) <- customer

who <- 'kim'

sum <- deposit[who] * ( 1 + rate[who] / 100)^ period[who]
sum



# 문자열 붙이기

str <- paste('good', 'morning', sep='/')
str

a <- '나의 나이는'
b <- 20
c <- '입니다.'
paste(a, b, c, sep=' ')


a <- 1:12
b <- '월'
c <-  paste(a, b, sep='')
c


# 월별 매출액 분석
sales <- c(750,740,760,680,700,710,850,890,700,720,690,730)
names(sales) <- paste(1:12, '월', sep="")
sales

sales['7월'] # 7월의 매출액
sales['1월']+sales['2월'] # 1월, 2월 매출액의 합
max.month <- sort(sales, decreasing=T)
max.month[1] # 가장 높은 매출액이 나온 달
sum(sales[1:6]) # 상반기 매출액의 합계










