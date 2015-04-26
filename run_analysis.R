#dataSetsName <- c("")
setwd("./")



testDataSet <- read.table("UCIHARDataset/test/X_test.txt")
testY <- read.table("UCIHARDataset/test/y_test.txt")
testSybject <- read.table("UCIHARDataset/test/subject_test.txt")

trainingDataSet <- read.table("UCIHARDataset/train/X_train.txt")
trainingY <- read.table("UCIHARDataset/train/y_train.txt")
trainingSubject <- read.table("UCIHARDataset/train/subject_train.txt")

completeY <- rbind(testY, trainingY)
completeDataSet <- rbind(testDataSet, trainingDataSet)
completeSuject <- rbind(testSybject, trainingSubject)


meanDataSet <- apply(completeDataSet,2,mean)
standardDeviation <- apply(completeDataSet,2,sd)
namesDataSet <- read.table("UCIHARDataset/features.txt")

activities <- read.table("UCIHARDataset/activity_labels.txt")
  
names(completeDataSet) <- namesDataSet$V2
names(meanDataSet) <- namesDataSet$V2
names(standardDeviation) <- namesDataSet$V2

#Rename activities 
completeDataSet$activity <- apply(completeY,2,function(i){ 
  activities$V2[i]
});

completeDataSet$subject <- completeSuject

dataSetTo5 <- apply(completeDataSet[1:561],2,function(iten){
  tapply(iten, completeDataSet$activity, mean)
});
