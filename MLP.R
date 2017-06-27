#MLP arguments:
#1.Learning coefficient
#2.Momentum
#3.Bias
#4.Epoch number
#5.Hiden layer neauron number
setwd(dirname(getActiveDocumentContext()$path))
wholeData = read.csv("datatrain.csv", header = FALSE,sep=",")
maxs <- apply(wholeData[,1:3], 2, max)
mins <- apply(wholeData[,1:3], 2, min)
scaledData <- scale(wholeData[,1:3],center = mins, scale = maxs - mins)
#set seed so both sets will be reproducable
set.seed(101)
sample <- sample.int(n = nrow(scaledData), size = floor(.50*nrow(scaledData)), replace = F)
trainSet <- scaledData[sample,]
testSet <- scaledData[-sample,]
#trainMatrix <- data.matrix(trainSet)
#testMatrix <- data.matrix(testSet)


CalculateMLP <- function(iters,learn,neurons)
{
  formula <- as.formula('V3 ~ V1 + V2')
  nn <- neuralnet(formula,trainSet,5,threshold = 0.1,stepmax = 1000,linear.output=FALSE)
  prediction <- compute(nn,testSet[,1:2])
  resultData<-prediction$net.result
  resultData
}
