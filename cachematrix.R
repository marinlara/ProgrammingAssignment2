## With this pair of functions we can cache the inverse of a matrix to imnprove
## computation cost

## The function makeCacheMatrix is a vector with 4 functions for define 
## and retrieve a matrix and his inverse:
## set <- sets a matrix
## get <- gets the cached matrix
## setinverse <- sets the inverse matrix
## getinverse <- gets the cached inversed matrix
makeCacheMatrix <- function(x = matrix()) {
    
    inv <- NULL
    
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    get <- function(){
      x  
    } 
    
    setinverse <- function(inverse){
        inv <<- inverse
    }
    
    getinverse <- function(){
        inv  
    } 
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}



## The function cacheSolve, computes the inverse of a matrix store 
## in makeCacheMatrix.
## If the inverse matrix is not previously computed, calculates it.
## Otherwise, returns the cached value.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
