## Below there are a pair of functions, from which:  
## the 1st creates a matrix that can cache its inverse
## the 2nd calculates the inverse of the first function 
## or retrieves it from the cache

## This function creates a new matrix object that can cache
## its inverse

makeCacheMatrix <- function(x = matrix()) {
     
      i <- NULL
      set <- function(y) {
            x <<- y
            i <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) i <<- solve
      getiverse <- function() i
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}

## The following function calculates the inverse of the special "matrix"
## created above after checking if this has already be computed.
## If it is copmuted, returns the result from above and skip calculations.

cacheSolve <- function(x, ...) {
      i <- x$getinverse()
      if(!is.null(i)) {
            message("getting cached data")
            return(i)
      }
      data <- x$get()
      i <- solve(data, ...)
      x$setinverse(i)
      i
      
## Return a matrix that is the inverse of 'x'
}
