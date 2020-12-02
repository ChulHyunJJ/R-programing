# Factor
blood.type <- c('A','A','B','AB','B','O')
blood.type
class(blood.type)
mode(blood.type)

blood.type <- factor(blood.type)
class(blood.type)
mode(blood.type)

# Ordered Factor
grade <- ordered(c('advanced'), levels=c('beginner','intermediate','advanced','expert'))
grade
class(grade)

size <- factor(c('large','large','small'),
               levels=c('small','medium','large','xlarge'),
               ordered = T)
size
class(size)

nlevels(grade)
levels(grade)
is.factor(grade)
is.ordered(grade)
is.ordered(blood.type)

# DataFrame
no <- c(1:5)
name <- c('apple','banana','carrot','peach','potato')
kind <- factor(c('fr','fr','ve','fr','ve'))
price <- c(1000,2000,500,2500,800)
qty <- c(10,5,7,3,12)

store <- data.frame(No = no, Name=name, Kind = kind, Price = price, Qty = qty)
store
class(store)
str(store)

student <- data.frame(name=c("Kate","Andy","Alice","Sam"),
                      gender=c("F","M","F","M"),
                      grade=c(2,3,1,4))
student

# Read Data
df_ch <- read.csv("C:/Users/Chris/MyGit/R_Practice/1.Setup/Data/character-deaths.csv")
df_ch
head(df_ch)
class(df_ch)
str(df_ch)

df_car <- read.table("C:/Users/Chris/MyGit/R_Practice/1.Setup/Data/cars.txt", header=TRUE)
head(df_car)
str(df_car)

df_cars <- read.csv("C:/Users/Chris/MyGit/R_Practice/1.Setup/Data/cars.csv", header=TRUE)
head(df_cars)
str(df_cars)

df_fr <- read.table("C:/Users/Chris/MyGit/R_Practice/1.Setup/Data/fruits.txt", header=F, skip=3)
head(df_fr)
str(df_fr)

df_fr2 <- read.table("C:/Users/Chris/MyGit/R_Practice/1.Setup/Data/fruits.txt", header=F, nrows=3)
head(df_fr2)
str(df_fr2)

data()
cars <- mtcars
head(cars)
str(cars)

cars[1,2]
cars[c(1:5), 1]
cars[c(1:5), 1, drop=F]

cars$mpg
cars[["mpg"]]
cars['mpg']

mean(cars$mpg)
mean(cars[["mpg"]])
mean(cars['mpg'])

cars[1, 1]
cars[1, 1] <- 20
cars[1, 1]

class(cars$cyl)
cars$cyl <- as.factor(cars$cyl)
cars$am <- as.factor(cars$am)
str(cars)

# New Column insert & delete
cars$plus <- cars$mpg * 100
head(cars)
cars$plus <- NULL
head(cars)

# Only Newmuric argg is able
cars[,c('cyl','gear','hp')]
cars[,-c(2,4)]
cars[,-c('cyc','hp')]
cars[c('cyl','gear','hp')]
cars[-c(2,4)]

cars[1:5,]
cars[c(10:20),]
cars[cars$cyl==6,]

cars[cars$cyl == 4 | cars$cyl == 6, c('mpg','hp','cyl')]
cars[cars$cyl %in% c(4,6), c('mpg','hp','cyl')]
