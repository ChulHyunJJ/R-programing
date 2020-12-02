# 단순 임의 추출
## 비복원 추출
dt <- iris$Petal.Length
str(dt)
sample(dt, 10)

# 복원 추출
sample(dt, 10, replace=T)

sample(1:5, 5)
sample(1:5, 5, replace=T)

## 가중치를 고려한 추출
sample(1:5, 5, replace=T, prob = c(10,20,20,50,1))

# 층화 임의 추출 : sampling::strata
install.packages("sampling")
library(sampling)

## strata
x <- strata(data=iris, stratanames = c('Species'), size=c(3,3,3), method = 'srswor')
x

## getdata
getdata(iris, x)

## 층마다 다른 수의 표본 추출
strata(data=iris, stratanames = c('Species'), size=c(3,2,1), method = 'srswr')

## 다수의 층에서 표본 추출
iris$Species2 <- rep(1:2, 75)
strata(data=iris, stratanames = c('Species', 'Species2'), 
       size=c(1,2,1,2,1,2), method = 'srswr')

## 계통 추출 : doby::sample_by
install.packages("doBy")
library(doBy)

x <- data.frame(x = 1:10)
x
sample_by(data = x, formula = ~1, frac = 0.2, systematic = TRUE)
sample_by(data = iris, formula = ~Species, frac = 0.2, systematic=T)

# 기술 통계
## 평균
mean(dt)

## 표본 분산
var(dt)

## 자유도 확인 N-1
dt
m <- mean(dt)
m
length(dt)

## 모분산
sum((dt - m) ^ 2) / length(dt)

## 표본분산
sum((dt - m) ^ 2) / (length(dt) - 1)

## 표본표준편차
sd(dt)

# 5 number summary : min, 1Q, 2Q(median), 3Q, max
fivenum(dt)
summary(dt)

## 최빈값
## 분할표 작성
table(dt)
which.max(table(dt))
names(table(dt))[5]

# 검정을 위한 분할표 작성 : table, xtabs
table(iris$Species)
xtabs(~Speices, data = iris)

d <- data.frame(x = c("1","2","2","1"),
                y = c("A","B","A","B"),
                num = c(3,5,8,7))
d

xtabs(num ~ x + y, data = d)

# 합계산 : margin.table
xt <- xtabs(num ~ x + y, data = d)
margin.table(xt, 1)
margin.table(xt, 2)
margin.table(xt)

# 비율 계산 : prop.table
xt
prop.table(xt,1)
prop.table(xt,2)
prop.table(xt)

# 독립성 검정
## 데이터 로드 : MASS::survey
library(MASS)
data(survey)
str(survey)

# 성별 : Sex , 운동의 정도 : Exer
ta <- xtabs(~ Sex + Exer, data=survey)
ta
chisq.test(xtabs(~ Sex + Exer, data=survey))
### 성별과 운동은 영향이 있다.
### df -> degree of freedom : 성별(2-1) * 운동(3-1)

xtabs(~W.Hnd + Clap, data = survey)
chisq.test(xtabs(~W.Hnd + Clap, data = survey))
### 데이터가 너무 적거나, 치우친경우 정확하지 않을 수 있다.

## 피셔의 정합 검정
fisher.test(xtabs(~W.Hnd + Clap, data = survey))
### 박수치는 손과 글씨 쓰는 손은 서로 연관이 있다.

# 맥니머 검정
Performance <-
  matrix(c(794, 86, 150, 570),
         nrow = 2,
         dimnames = list("1st Survey" = c("Approve", "Disapprove"),
                         "2nd Survey" = c("Approve", "Disapprove")))
Performance
mcnemar.test(Performance)
### 첫번째와 두번째 설문에는 차이가 있다.

# t-test
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

## compact, suv 자동차의 도시 연비 차이 검증
mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c('compact','suv'))

table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)
### var.equal 두집단의 분산은 같다 라는 설정
### compact와 suv 와의 도시연비 차이는 존재한다.

## 일반 휘발유와 고급 휘발유의 도시연비 차이
mpg_diff2 <- mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c('r','p'))

table(mpg_diff2$fl)

t.test(data=mpg_diff2, cty ~ fl, var.equal = T)
## p-value > 0.05 이기 때문에 귀무가설을 채택 한다.
## 두 유종간의 차이는 의미가 없다.

# 상관 분석
economics <- as.data.frame(ggplot2::economics)
str(economics)
cor.test(economics$unemploy, economics$pce)
## cor = 0.6 어느정도 관계는 있다

# 상관 행렬
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor, 2)

# 상관 행렬 히트맵
install.packages('corrplot')
library(corrplot)
corrplot(car_cor)
corrplot(car_cor, method='number')

corrplot(car_cor, 
         method = 'color', 
         type = "lower", 
         order = 'hclust', 
         addCoef.col = 'black',
         tl.col = 'gray',
         tl.srt = 45, 
         diag = F)
