source("MLP.R")
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
    #print("-------------------")
    #message("Result ",M1[i,1])
    #message("Scaled ",val)
    #message("Ideal ",M2[i,3])
  }
  result <- ((points*100)/n)
  result
}

PrintResult <- function(X)
{
  iters <- BinToDec(paste(X[1:10] , collapse =""))*20
  learn <- (BinToDec(paste(X[11:15] , collapse ="")))/100
  neurons <- BinToDec(paste(X[16:20] , collapse =""))
  thresh <- BinToDec(paste(X[21:24] , collapse =""))/100
  print("----------RESULT------------")
  message("Iterations: ",iters)
  message("Learning factor: ",learn)
  message("Neurons: ",neurons)
  message("Threshold: ",thresh)
  print("----------------------------")
}

Fitness  <- function(X)
{
  iters <- BinToDec(paste(X[1:10] , collapse =""))*20
  learn <- (BinToDec(paste(X[11:15] , collapse ="")))/100
  neurons <- BinToDec(paste(X[16:20] , collapse =""))
  thresh <- BinToDec(paste(X[21:24] , collapse =""))/100

  result <- 0
    tryCatch(
      {
        resultData <- CalculateMLP(iters,learn,neurons,thresh)
        result <- Error(resultData,testSet)
        print("Result")
        print(result)
        result
      },warning = function(w){
        result
      },erro = function(e){
        result
      }
    )
}

