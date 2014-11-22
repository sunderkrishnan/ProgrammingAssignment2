### Programming Assignment 2 - RStudio Output

#### Setting up a matrix
> a <- makeCacheMatrix()

> a$set (matrix(c(1:4), 2, 2))

#### Solving for the inverse
> cacheSolve(a)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

#### Solving again for the inverse
> cacheSolve(a)
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

> 