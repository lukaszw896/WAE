library(iterators)
library(foreach)
library(GA)

BinToDec <- function(x) {
  sum(2^(which(rev(unlist(strsplit(as.character(x), "")) == 1))-1))
}

Error <- function(M1,M2)
{
  points <- 0
  n<-nrow(M1)
  for(i in 1:n)
  {
    val <- 0
    if(M1[i,1]<0.33)
    {
      val<- 0
    }
    if(M1[i,1]<0.66 & M1[i,1]>=0.33)
    {
      val<- 0.5
    }
    if(M1[i,1]<=1 & M1[i,1]>=0.66)
    {
      val<- 1
    }
    if(val == M2[i,3])
    {
      points <- points + 1
    }
  }
  result <- ((points*100)/n)
  result
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