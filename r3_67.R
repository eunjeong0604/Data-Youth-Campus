setwd('C:/Rworks')


##### 6. 데이터 입력하고 출력하기 #####

### 데이터 읽고쓰기 ###
## R에서의 입력과 출력
age <- c(28, 17, 35, 46, 23, 67, 30, 50)  # 데이터 입력
age

young <- min(age)  # 정보 추출
old <- max(age)

cat('가장 젊은 사람의 나이는 ', young, '이고, \n가장 나이든 사람의 나이는 ', old, '입니다.')  # 처리결과 추출



## 화면에서 데이터 입력받기
install.packages('svDialogs')
library(svDialogs)

# dlgInput : 팝업창을 띄우고 값을 입력받음
# res : dlgInput함수 실행 결과에서 사용자가 입력한 값을 추출
user.input <- dlgInput('Input income')$res
user.input

income <- as.numeric(user.input)  # 문자열을 숫자로
income

tax <- income*0.05
cat('세금: ', tax)



## print 함수와 cat 함수

x <- 26
y <- '입니다'
z <- c(10, 20, 30, 40)

print(x)
print(y)
print(z)
print(iris[1:5,])
print(x,y)  # Error

cat(x, '\n')
cat(y, '\n')
cat(z, '\n')
cat(x, y, '\n')
cat(iris[1:5], '\n')  # Error : 데이터프레임은 안됨



## lab.체질량 지수 계산
library(svDialogs)

height <- dlgInput('Input height(cm)')$res
weight <- dlgInput('Input weight(kg)')$res

height <- as.numeric(height)
weight <- as.numeric(weight)

height <- height/100
bmi <- weight/(height^2)

cat('입력한 키는', height*100, 'cm, 몸무게는 ', weight, 'kg 입니다. \n', sep="")
cat('BMI는 ', bmi, '입니다.', sep="")



### 작업 폴더 ###
getwd()
setwd('C:/Rworks')
getwd()



## csv 파일 읽기와 쓰기

air <- read.csv('C:/Users/LG/Desktop/데청캠/R/R특강-3일차-st/Ch06/airquality.csv', header=T)

head(air)
class(air)

# setosa 품종 데이터만 추출
my.iris <- subset(iris, Species=='setosa')
my.iris

# .csv 파일 저장
write.csv(my.iris, 'my_iris.csv', row.names=F)  # my_iris 저장시 행이름은 제외



## excel 파일 읽기와 쓰기

install.packages('xlsx')
library(xlsx)
air <- read.xlsx('C:/Users/LG/Desktop/데청캠/R/R특강-3일차-st/Ch06/airquality.xlsx',
                 header=T, sheetIndex=1)
head(air)

my.iris <- subset(iris, Species=='setosa')
my.iris

write.xlsx(my.iris, 'my_iris.xlsx', row.names = F)



## lab. 다이아몬드 정보 제공하기

setwd('C:/Rworks/Shiny')

library(ggplot2)
str(diamonds)

# 조건에 맞는 데이터를 추출해 새로운 변수에 저장
diamonds.new <- subset(diamonds, cut=='Premium' & carat>=2)

# 추출한 데이터를 파일로 저장
write.csv(diamonds.new, 'shiny_diamonds.csv', row.names=F)

# 다시 csv파일을 불러와 새 변수에 저장
diamonds.load <- read.csv('shiny_diamonds.csv', header=T)

# 색이 D인 경우를 제외하여 새로운 변수에 저장
diamonds.new <- subset(diamonds.load, color != 'D')

# 추출한 데이터를 shiny_diamonds.xlsx로 저장 (색이 D인 경우가 제외됨)
write.xlsx(diamonds.new, 'shiny_diamonds.xlsx', row.names=F)




### 파일 입출력에서 알아야 할 내용

## 실행 결과 파일로 출력하기
setwd('C:/Rworks')
print('Begin work')

a <- 10; b <- 20

# 여기부터 실행되는 결과는 파일에 저장하겠다.
# append=F인 경우 기존에 있던 내용을 지우고 새로 출력하는 것 의미
sink('result.txt', append=T)
cat('a+b = ', a + b, '\n')
sink( )  # 파일 출력 정지

cat('hello world \n')


# 다시 파일에 저장
sink('result.txt', append=T)
cat('a*b = ', a * b, '\n')
sink( )  # 파일 출력 정지

print('End work')



## 탭이나 공백으로 분리된 파일 읽기

setwd('C:/Rworks')
air <- read.table('C:/Users/LG/Desktop/데청캠/R/R특강-3일차-st/Ch06/airquality.txt',
                  header=T, sep=' ')
head(air)



## lab. 체질량 지수 계산하기2
# 키와 몸무게를 입력받을 때마다 결과를 저장하는 기능 추가
library(svDialogs)

height <- dlgInput('Input height (cm) ')$res
weight <- dlgInput('Input weight (kg) ')$res

height <- as.numeric(height)
weight <- as.numeric(weight)

height <- height/100
bmi <- weight/(height^2)

# 결과를 파일로 저장
sink('bmi.txt', append=T)
cat(height*100, weight, bmi)
cat('\n')
sink( )

# bmi.txt 파일을 불러와 변수 result에 저장하고 값 확인
result <- read.table('bmi.txt', sep=' ')
result

# result에서 열이름을 설정한 뒤 새로운 파일로 저장
names(result) <- c('height', 'weight', 'bmi')
write.table(result, 'bmi_new.txt', row.names=F)



## 실전분석. 자동차 정보를 찾아 파일로 출력

library(svDialogs)
library(xlsx)

carprice.new <- read.csv('C:/Users/LG/Desktop/데청캠/R/R특강-3일차-st/Ch06/carprice.csv', header=T)
str(carprice.new)

# 조건 값 입력하여 저장
input.type <- dlgInput('Input type')$res
input.city <- dlgInput('Input MPG.city')$res

# 숫자형으로 변경
input.city <- as.numeric(input.city)

# 두 조건을 만족하는 데이터추출하여 저장
result <- subset(carprice.new, Type==input.type & MPG.city>=input.city)

# 결과를 화면과 텍스트파일에 동시 출력
print(result)
sink('search.txt', append=T)
print(result)
sink( )

# result에 저장된 데이터를 엑셀 파일로 저장
write.xlsx(result, 'search.xlsx', row.names=F)





##### 7. 제어문과 사용자 정의 함수 사용하기 #####

## if-else문
#
job.type <- 'A'

if (job.type == 'B'){
  bonus <- 200
}else{
  bonus <- 100
}

print(bonus)


#
a <- 10

if (a<5){
  print(a)
} else {
  print(a*10)
  print(a/10)
}


# and, or 을 이용한 조건문
a <- 10
b <- 20

if (a>5 & b>5){
  print(a+b)
}

if (a>5 | b>30){
  print(a*b)
}




## ifelse문

# if-else를 이용한 처리
a <- 10
b <- 20

if (a>b){
  c <- a
} else {
  c <- b
}

print(c)


# ifelse를 이용한 처리
a <- 10
b <- 20

c <- ifelse(a>b, a, b)
print(c)


# if-else의 반복
score <- 85

if (score>90) {
  grade <- 'A'
} else if (score>80) {
  grade <- 'B'
} else if (score>70) {
  grade <- 'C'
} else if (score>60) {
  grade <- 'D'
} else {
  grade <- 'F'
}

print(grade)



## num 값이 홀수인지 작수인지

num <- 13

if (num%%2 == 0) {
  print('even')
} else {
  print('odd')
}



## lab. 회원 등급 분류하고 혜택 부여하기

# my solution
price = 350000

if (price >= 300000) {
  print("플래티넘")
  tot_price = price*0.93
  print("최종금액 : ", tot_price)
} else if (price >= 200000) {
  print("골드")
  tot_price = price*0.95
  print("최종금액 : ", tot_price)
} else if (price >= 100000) {
  print("실버")
  tot_price = price*0.97
  print("최종금액 : ", tot_price)
} else {
  print("프렌즈")
  tot_price = price*0.99
  print("최종금액 : ", tot_price)
}


# ppt solution

library(svDialogs)

purchase <- dlgInput('Enter the purchase amount')$res
purchase <- as.numeric(purchase)

type <- NULL
ratio <- NULL

if (purchase >= 300000) {
  type <- '플래티넘'
  ratio <- 0.07
} else if (purchase >= 200000) {
  type <- '골드'
  ratio <- 0.05
} else if (purchase >= 100000) {
  type <- '실버'
  ratio <- 0.03
} else {
  type <- '프렌즈'
  ratio <- 0.01
}

cat('고객님은', type, '회원으로 구매액의', ratio*100, "%가 적립됩니다.")





## 반복문 : for문

for (i in 1:5) {
  print('*')
}


for (i in 6:10) {
  print(i)
}


# 구구단 2단
for (i in 1:9) {
  cat('2 *', i, '=', 2*i, '\n')
}


# 1:20 중 짝수만 출력하기
for (i in 1:20) {
  if(i%%2 == 0) {
    cat(i, ' ')
  }
}


# 1:50 범위에서 3, 4의 배수 구하기

for (i in 1:50) {
  if (i%%3 == 0 | i%%4 == 0){
    cat(i, ' ')
  }
}


# 1:100까지 누적합 구하기
sum <- 0

for (i in 1:100) {
  sum <- sum + i
}
print(sum)


# 꽃잎의 길이에 따라 label 결정해서 데이터 프레임 만들기
norow <- nrow(iris)
mylabel <- c()

for (i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) {
    mylabel[i] <- 'L'
    
  } else if (iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
    
  } else {
    mylabel[i] <- 'M'
  }
}

print(mylabel)
newds <- data.frame(iris$Petal.Length, mylabel)
head(newds, 10)


## 반복문 : while문
# 조건이 만족하지 않으면 해당 문장을 실행하지 않는다

i <- 1

while (i <= 10) {
  print(i)
  i <- i + 1
}


# 1부터 100까지 누적합 구하기
sum <- 0
i <- 1

while (i <= 100) {
  sum <- sum + i
  i <-  i + 1
}

print(sum)




## lab. 자격증 합격 여부 판단하기

sub1 <- c(14, 16, 12, 20, 8, 6, 12, 18, 16, 10)
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14)
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32)
score <- data.frame(sub1, sub2, sub3)

total <- apply(score, 1, sum)
scoreset <- cbind(score, total)
scoreset

result <- c()

for(i in 1:nrow(scoreset)){
  if(scoreset[i,1] < 20*0.4 | scoreset[i,2] < 20*0.4 | scoreset[i,3] < 60*0.4){
    result[i] <- '불합격'
    
  }else if(scoreset[i,4] >= 60){
    result[i] <- '합격'
    
  }else{
    result[i] <- '불합격'
  }  
  cat(i, '번째 응시생은', result[i],'입니다.\n')
}




##### 사용자 정의 함수 #####
# 07번 ppt 43 page














