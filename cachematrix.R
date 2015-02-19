## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

  
  m <- NULL
  set <- function(y) {
    x <<- y ## assign the matrix y to the  x in parent environment
    m <<- NULL ## initialize m in the parent environment
  }
  get <- function() x 
  setinverse <- function(inverse) m <<- inverse ## set the cache m to the inverse of the matrix x
  getinverse <- function() m 
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getinverse()
      if(!is.null(m)) {
        message("getting cached data")
        return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}
