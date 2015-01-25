## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


makeCacheMatrix <- function(x = matrix()) {
## function contains OOP-like getter and setter functions

	m<-NULL  ## make shure the matrix is emtpy
  	set<-function(y){
    x<<-y ## will make it visible to parent environments 
    m<<-NULL ## make shure the matrix is empty in parent env
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve ## set value of m
  getmatrix<-function() m  ## get value of m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix() ## load the cached data
  if(!is.null(m)){ ## test if there is data present
    message("getting cached data")
    return(m)
  }
  matrix<-x$get() ## if data is not present load it
  m<-solve(matrix, ...)
  x$setmatrix(m) ## call of function that is inside makeCacheMatrix 
  m
}
