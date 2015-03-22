## 


## The make cache matrix function will create a special matrix that will
## create the space for the cached inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    # Set the initial value to null
    invmat <- NULL
    
    # Set function to store the matrix
    set <- function(y) {
        x <<- y
        invmat <<- NULL
    }
    
    # Get function to retrieve the matrix
    get <- function() x
    
    # Function for getting the cached Inverse
    getInverse <- function() invmat
    
    # Function for setting the cached Inverse
    setInverse <- function(inv) invmat <<- inv
    list( set = set, get = get,
          getInverse = getInverse,
          setInverse = setInverse )
}


## The cache solve function will calculate the inverse matrix of the matrix passed
## above. If the matrix matches the previously entered one and we have already
## calculated it we will just return that value. If it's a new matrix then we
## will calculate the inverse and store

cacheSolve <- function(x, ...) {
        inverse <- x$getInverse()
        if(!is.null(inverse)) {
            message("getting cached data")
            return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setInverse(inverse)
        inverse
}
