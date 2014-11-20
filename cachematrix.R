##################################################################
## The goal is to reduce costly computations when inputs are unchanged. 
## We use lexical scoping to cache a previously calculated result
## of a function and use the cached result without going through
## expensive computation when the function is called with the same inputs.

## In this case, the function whose reults we will cache is solve()
## which calculates the inverse of a matrix.

## Assumptions:  The input matrix is always invertible
##################################################################

## The makeCacheMatrix() function is used to return a list of functions:
## - set an input matrix
## - return the matrix that has been set previously
## - set the inverse of the matrix
## - return the inverse of the matrix previously saved

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    
    ##assign new input matrix and set inverse to NULL when first  called
    set <- function (newmatrix) {
        x <<- newmatrix
        inverse <<- NULL
    }
    
    ## return the cached input matrix
    get <- function () {
        x
    }
    
    ## save the new inverse matrix to cache
    setinverse <- function (newinverse) {
        inverse <<- newinverse
    }
    
    ## return the cached inverse matrix
    getinverse <- function () {
        inverse
    }
    
    ## return the list of functions
    list (set = set, get = get,
          setinverse = setinverse,
          getinverse = getinverse)
}


## The cacheSolve() function does the actual work
## It finds the inverse of a matrix using solve()
## but it first checks if the inverse has been previously
## calculated and cached. If so, it returns the cached value
## If not, it sets the new matrix, finds its inverse and 
## set the inverse in the cache for future use.

cacheSolve <- function(x = matrix(), ...) {
    
    ## check if inverse is cached
    i <- x$getinverse ()
    
    ## if cached, return it
    if ( !is.null (i) ) {
        message ("getting cached data")
        return (i)
    }
    
    ## if not cached, get the input matrix
    ## calcualte the inverse usign solve() and save it to cache
    data <- x$get()
    i <- solve (data, ...)
    x$setinverse (i)
    
    ## return the inverse
    i
    
}
