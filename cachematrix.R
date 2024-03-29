## The fuction of makeCacheMatrix : Creates a special "matrix" object
## The fuction of makeCacheMatrix : cacheSolve

## Creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
      set <- function(y = matrix()) {
              x <<- y
              i <<- NULL
      }
      get <- function() x
      setinverse <- function(inverse) i <<- inverse
      getinverse <- function() i
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## Computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated, then retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
	i <- x$getinverse()
      if(!is.null(i)) {
            message("getting cached data")
      }
	else {
		data <- x$get()
	      i <- solve(data)
      	x$setinverse(i)
      }
      i
}
