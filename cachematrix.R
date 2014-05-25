## This function caches the inverse of a matrix

## This function creates a list of the results or if not yet calculated

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set=set, get=get, 
             setsolve = setsolve, 
             getsolve = getsolve)
}


## This function inverts a matrix and returns a value to cache

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setsolve(m)
        m
}
