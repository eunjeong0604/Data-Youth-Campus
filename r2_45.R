setwd('C:/Rworks')

##### 4. 벡터 다루기 #####
##### 벡터 연산 #####
x <- c(1, 2, 3, 4)
y <- c(5, 6, 7, 8)
x + y
x * y
z <- x + y
z



##### 논리연산자 #####
d <- 1:9
d >= 5
d[d>5]
sum(d>5)
sum(d[d>5])

condi <- d>5 & d<8
d[condi]



##### R 카페의 매출액 분석하기 #####
espresso <- c(4, 5, 3, 6, 5, 4, 7)
americano <- c(63, 68, 64, 68, 72, 89, 94)
latte <- c(61, 70, 59, 71, 71, 92, 88)

# 요일별 매출액
sale.espresso <- 2 * espresso
sale.americano <- 2.5 * americano
sale.latte <- 3.0 * latte

sale.day <- sale.espresso + sale.americano + sale.latte
names(sale.day) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
sale.day


# 일주일간 총 매출액
sum(sale.day)

# 일평균 매출액
sale.mean <- mean(sale.day)
sale.mean

# 매출액이 평균 이상인 요일
names(sale.day[sale.day >= sale.mean])



##### 팩터 #####

bt <- c('A', 'B', 'B', 'O', 'AB', 'A')
bt.new <- factor(bt)
bt
bt.new
bt[5]
bt.new[5]

levels(bt.new)  # 팩터에 저장된 값의 종류를 출력 (중복된 값을 빼줌)
as.integer(bt.new)  # 팩터의 문자값을 숫자로 바꿔 출력(알파벳 순으로 숫자 정함)

bt.new[7] <- 'B'
bt.new[8] <- 'C' # 저장되어 있지 않은 값은 추가가 안됨
bt.new  



##### 리스트 #####

h.list <- c('balling', 'tennis', 'ski')
person <-  list(name='Tom', age=25, student=TRUE, hobby=h.list)
person

person[[1]]
person$name
person[[4]]



##### R 카페의 매출액 분석하기2 (리스트, 팩터 이용) #####

cafe <- list(espresso = c(4, 5, 3, 6, 5, 4, 7),
             americano = c(63, 68, 64, 68, 72, 89, 94),
             latte = c(61, 70, 59, 71, 71, 92, 88),
             price = c(2.0, 2.5, 3.0),
             menu = c('espresso','americano','latte'))
cafe

cafe$menu <-  factor(cafe$menu)
names(cafe$price) <- cafe$menu # 값에 메뉴명 설정

# 각 메뉴의 요일별 매출액
sale.espresso <- cafe$price['espresso'] * cafe$espresso
sale.americano <- cafe$price['americano'] * cafe$americano
sale.latte <- cafe$price['latte'] * cafe$latte

# 요일별 매출액
sale.day <- sale.espresso + sale.americano + sale.latte
names(sale.day) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
sale.day

# 총매출액
sum(sale.day)

# 평균 매출액
sale.mean <- mean(sale.day)
sale.mean

# 평균 매출액 이상인 요일
names(sale.day[sale.day >= sale.mean])



##### 실전분석 #####
# 월별 감전 사고 통계 분석하기

accident <- c(31,26,42,47,50,54,70,66,43,32,32,22)
names(accident) <- c('M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8', 'M9', 'M10', 'M11', 'M12')


# 1년간 총 감전가소 건수
sum(accident)

# 가장 사고가 많은 달, 가장 사고가 적은 달
max(accident)
min(accident)

# 사고율이 10% 감소한다면
accident*0.9

# 사고 건수가 50건을 넘는 달만 출력
accident[accident>=50]

# 사고 건수가 50건을 넘는 달의 이름
month50 <- accident[accident >= 50]
names(month50)
names(accident[accident>=50])

# 사고 건수가 50미만인 달은 몇 개월인지
length(accident[accident<50])

# 6월보다 사고가 많은 달과 사고 건수
accident[accident > accident[6]]





##### 5. 매트릭스와 데이터프레임 #####
##### 매트릭스 #####

## 매트릭스는 열 방향으로 채워진다
z <- matrix(1:20, nrow=4, ncol=5)
z

## 행방향으로 채우기
z2 <- matrix(1:20, nrow=4, ncol=5, byrow=T)
z2


## 벡터를 합쳐 매트릭스 만들기(행방향, 열방향)
x <- 1:4
y <- 5:8
z <- matrix(1:20, nrow=4, ncol=5)

m1 <- cbind(x, y)
m2 <- rbind(x, y)
m3 <- rbind(m2, x)
m4 <- cbind(z, x)

m1
m2
m3
m4


## 매트릭스에서 값 추출

z <- matrix(1:20, nrow=4, ncol=5)

z[2, 3]
z[1,4]

z[2,]
z[,4]

z[2, 1:3]
z[1, c(1,2,4)]

z[1:2,]
z[,c(1,4)]



## 행, 열에 이름 붙이기

score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60), nrow=4)
score

rownames(score) <- c('John','Tom','Mark','Jane')
colnames(score) <- c('English','Math','Science')
score

score['John', 'Math']
score['Tom', c('Math', 'Science')]

score['Mark',]
score[,'English']

colnames(score)[2] 



## 햄버거 영양 성분 정보 제공하기 ##

burger <- matrix(c(514, 917, 11, 533, 853, 13, 566, 888, 19),
                 nrow = 3, byrow = T)
burger

# 이름붙이기
rownames(burger) <- c('M', 'L', 'B')
colnames(burger) <- c('kcal', 'na', 'fat')
burger

burger['M', 'na']
burger['M',]
burger[, 'kcal']



## 벡터를 이용해 행렬 객체 생성 (c()함수는 열 기준으로 객체 생성)

m <- matrix(c(1:5))
m

m <- matrix(c(1:10), nrow=2)
m

# 행렬 객체에 대한 자료형
mode(m)

# 행렬 객체에 대한 자료구조
class(m)


## apply() 함수 : 행렬 구조의 자료를 처리하는 함수

m <- matrix(c(1:9), nrow=3, ncol=3)
m

apply(m, 1, max)
apply(m, 1, min)
apply(m, 1, mean)




##### 데이터프레임 #####

# 데이터프레임 만들기
city <- c("Seoul","Tokyo","Washington")
rank <- c(1, 3, 2)

city.info <- data.frame(city, rank)
city.info


## iris data

iris[,c(1:2)]
iris[,c(1,3,5)]
iris[,c("Sepal.Length", 'Species')]

iris[1:5,]
iris[1:5, c(1, 3)]



## 햄버거 영양 성분 정보 추가하기 ##

kcal <- c(514, 533, 566)
na <- c(917, 853, 888)
fat <- c(11, 13, 10)
menu <- c('새우', '불고기', '치킨')

burger <- data.frame(kcal, na, fat, menu)
burger

rownames(burger) <- c('M', 'L', 'B')

burger['M', 'na']
burger['M',]
burger[, 'kcal']
burger[c('M', 'B'), 'menu']



## 데이터셋의 기본정보 알아보기

dim(iris)
nrow(iris)
ncol(iris)
colnames(iris)
head(iris)
tail(iris)


str(iris) # 데이터셋에 대한 요약 정보
levels(iris[,5]) # 풍종의 종류보기 (중복 제거)
table(iris[,'Species']) # 품종별 행의 개수 세기




## 매트릭스와 데이터프레임에 함수 적용

# 행별, 열별로 합계와 평균 계산
colSums(iris[, -5]) # 5번째 열을 제외한 4개의 열에 대한 열별 합계
colMeans(iris[,-5])
rowSums(iris[,-5]) # 5번째 열을 제외한 4개의 열에 대한 행별 합계
rowMeans(iris[,-5])


# 조건에 맞는 행과 열의 값 추출하기 **중요**
IR.1 <- subset(iris, Species=='setosa')
IR.2 <- subset(iris, Sepal.Length>5 & Sepal.Width>4)
IR.2
IR.2[, c(2, 4)]


# 매트릭스와 데이터프레임에 산술연산 적용하기
a <- matrix(1:20, 4, 5)
b <- matrix(21:40, 4, 5)

2*a
a+b

a <- a*3
b <- b-5


# 매트릭스와 데이터프레임의 자료구조 확인과 변환
class(iris)
class(state.x77)

is.matrix(iris)
is.data.frame(iris)

is.matrix(state.x77)
is.data.frame(state.x77)


# 매트릭스와 데이터프레임의 자료구조 변환
# 매트릭스 -> 데이터프레임
is.matrix(state.x77)
st <- data.frame(state.x77)
head(st)
class(st)

# 데이터프레임 -> 매트릭스
is.data.frame(iris[,1:4])
iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)



## 데이터프레임에만 적용되는 열 추출 방법
iris[,'Species']  # vector, matrix, dataframe 모두 가능
iris[,5]  # vector, matrix, dataframe 모두 가능
iris['Species']  # dataframe만 가능
iris[5]  # dataframe만 가능
iris$Species  # vector, dataframe만 가능



## lab. 벚나무 판매하기
class(trees)
str(trees)

grith.mean <- mean(trees$Girth)
grith.mean

candidate <- subset(trees, Girth > grith.mean & Height > 80 & Volume > 50)
candidate
nrow(candidate)  # 결과적으로 총 3그루가 조건을 만족한다.


## 실전분석. 종업원의 팁 계산하기
install.packages('reshape2')
library(reshape2)

is.matrix(tips)
class(tips)

head(tips)
str(tips)
dim(tips)

# 요일별 팁을 받는 빈도
table(tips$day)

# 요일별로 시간대를 Dinner, Lunch인 경우로 나누어 팁의 빈도차이에 대해 알아보자
dinner <- subset(tips, time=='Dinner')
lunch <- subset(tips, time=='Lunch')

table(dinner$day)  # 요일별 팁을 받는빈도 
table(lunch$day)

# 결제 금액, 팁, 일행 수에 대한 평균 구하기
colMeans(dinner[c('total_bill', 'tip', 'size')])
colMeans(lunch[c('total_bill', 'tip', 'size')])

# 결제 금액 대비 팁을 평균적으로 몇 % 줬는지
tip.rate <- tips$tip/tips$total_bill  # 손님별 tip 비율
mean(tip.rate)  # 16% 정도 줌
















