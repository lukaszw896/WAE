library(monmlp)

#Evolutinary algorithm parameters:
#1.Learning coefficient
#2.Momentum
#3.Bias
#4.Epoch number
#5.Hiden layer neauron number
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
wholeData = read.csv("datatrain.csv", header = FALSE,sep=",")
#set seed so both sets will be reproducable
set.seed(101)
sample <- sample.int(n = nrow(wholeData), size = floor(.50*nrow(wholeData)), replace = F)
trainSet <- wholeData[sample,]
testSet <- wholeData[-sample,]
#model = monmlp.fit()a
