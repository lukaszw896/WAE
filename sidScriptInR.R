library(iterators)
library(foreach)
library(GA)

BinToDec <- function(x) {
  sum(2^(which(rev(unlist(strsplit(as.character(x), "")) == 1))-1))
}

Fitness  <- function(X)
{
  iters <- BinToDec(paste(X[1:10] , collapse =""))
  learn <- BinToDec(paste(X[11:20] , collapse =""))
  neurons <- BinToDec(paste(X[21:30] , collapse =""))
  result <- 0
  #do some neural shiet
  result
}

GA <- ga("binary", fitness = Fitness, nBits = 30)
summary(GA)
plot(GA)