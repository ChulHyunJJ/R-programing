# Matrix
data <- c(1:8)
data
m1 <- matrix(data=data, nrow=2, ncol=4)
m1
colnames(m1) <- paste(c('C'), 1:4, sep='')
m1
rownames(m1) <- c('R1','R2')
m1
dimnames(m1) <- list(c('row1','row2'),
                     c('col1','col2','col3','col4'))
m1

m2 <- matrix(11:18, 2, 4, byrow=T, 
             dimnames=list(c('row1','row2'),
                           c('col1','col2','col3','col4')))
m2

# Matrix indexing
m1[1,1]
m1[2,]
m1[,3]
m1[2,c(1:2)]
m1[2,c(2:4)]

m2
m2['row1','col2']
m2['row1',]
m2[,'col2']
m2['row2', c('col1','col3')]

# Matrix Calcualtion
x <- matrix(1:4, nrow=2)
y <- matrix(5:8, nrow=2) 
x
y

x+y
x-y
x*y
x%*%y
# Transpose
x
t(x)
aperm(x)

# determinant
solve(x)
det(x)

# bind
x;y
rbind(x,y)
cbind(x,y)

# Array
d1 <- array(1:36, dim=c(6,3,2))
d1

d1[2,2,2]
d1[,2,2]
d1[2,,2]
d1[,,2]

dim(d1)

x <- c(1:12)
dim(x) <- c(3,4)
x

# Apply 1 = row, 2 = col
apply(x, 1, sum)
apply(x, 2, sum)
