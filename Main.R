library(iterators)
library(foreach)
library(GA)
library(rstudioapi)
library(neuralnet)
library(doParallel)
#set working directory
setwd(dirname(getActiveDocumentContext()$path))
#load files
source("HelperFunctions.R")
source("MLP.R")
####################
#     Prepare data
####################
wholeData = read.csv("datatrain.csv", header = FALSE,sep=",")
maxs <- apply(wholeData[,1:3], 2, max)
mins <- apply(wholeData[,1:3], 2, min)
scaledData <- scale(wholeData[,1:3],center = mins, scale = maxs - mins)
#set seed so both sets will be reproducable
set.seed(117)
sample <- sample.int(n = nrow(scaledData), size = floor(.50*nrow(scaledData)), replace = F)
trainSet <- scaledData[sample,]
testSet <- scaledData[-sample,]


#run genetic algorithm
GA <- ga("binary", fitness = Fitness, nBits = 24, maxiter = 20, popSize = 15, keepBest = TRUE)
summary(GA)
plot(GA)
GA@solution
PrintResult(GA@solution)