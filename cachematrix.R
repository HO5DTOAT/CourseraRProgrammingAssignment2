## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  get <- function() { x }
  
  set <- function(mat) {
    x <<- mat
    inverse <<- NULL # clear inverse
  }
  
  setinverse <- function(inv) {
    inverse <<- inv
  }
  
  getinverse <- function() {
    # Return the inverse
    inverse
  }
  
  list( get = get, set = set, getinverse = getinverse, setinverse = setinverse )
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  
  # Calculate inverse if not already done
  if (is.null(inverse)) {
    inverse <- solve(x$get(), ...)
    x$setinverse(inverse)
  }
  else {
    # Inform about reading cached result
    message("Getting cached data")
  }
  
  inverse
}
