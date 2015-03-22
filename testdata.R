# Testing file

runTestCache <- function() {
    # Set up a matrix
    x <- matrix( 1:4, 2, 2 )
    print("x contains")
    print(x)
    
    # Set up our special cache variable
    print("Making cache matrix")
    y <- makeCacheMatrix( x )
    print("y contains")
    print(y)
    
    # Calculate the inverse (this is the first time so it should be calculated)
    print("Calculating inverse, no previous cache")
    z <- cacheSolve(y)
    print("z contains")
    print(z)
    
    # Calculate again, this time it should use the cache
    print("Calculating inverse, from cache")
    z <- cacheSolve(y)
    print("z contains")
    print(z)
    
    # Change the matrix
    print("Changing the matrix with set")
    y$set( matrix( 4:1, 2, 2 ) )
    
    # Calculate to make sure that it doesn't use the cache and recalculates
    print("Calculating the inverse, no cache, new value")
    z <- cacheSolve(y)
    print("z contains")
    print(z)
    
    # Check that the cache is used in this case
    print("Calculating inverse, from cache")
    z <- cacheSolve(y)
    print("z contains")
    print(z)
    
    # Finally make the cache again to make sure
    y <- makeCacheMatrix(x)
    
    # Calculate the inverse (no cache)
    cacheSolve(y)
    
    # And again with the cache
    cacheSolve(y)
}