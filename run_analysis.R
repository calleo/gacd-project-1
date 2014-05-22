
# Use function runAnalysis() to start creation of the
# tidy data set. All parameters are optional.

runAnalysis <- function(wdir = ".", targetFile = "tidy.txt") {
  
  ## Set working directory
  setwd(wdir)
  
  allData <- readData()
  
  ## Add activity informationm
  allData <- addActivity(allData)
  
  ## Add subject to data set
  allData <- addSubject(allData)
  
  ## Calculate mean per Subject/Activity
  aggData <- calcMean(allData)
  
  ## Modify column names for usability
  aggData <- makeColNames(aggData)
  
  ## Write to new file (tidy data set)
  write.table(aggData,targetFile)
  
  return(aggData)
}

readData <- function() {
  
  ## File names
  testFile <- paste(rootDir(), "test", "X_test.txt", sep="/")
  trainFile <- paste(rootDir(), "train", "X_train.txt", sep="/")
  featFile <- paste(rootDir(), "features.txt", sep="/")
  
  ## Read test and training data
  testData <- read.table(testFile)
  trainData <- read.table(trainFile)
  
  allData <- rbind(testData, trainData)
  
  ## Read feature names (will be used as column headers)
  featNames <- read.table(featFile)[,2]
  featNames <- as.vector(featNames)
  
  ## Set column names in data set
  colnames(allData) <- featNames
  
  ## Get the columns representing the mean and standard deviation
  cols <- c(grep("mean[(][)]", featNames), grep("std[(][)]", featNames))
  
  ## Keep only those columns
  allData <- allData[,cols]
  
  return(allData)
}

makeColNames <- function(sensorData) {
  
  ## Clean the column names for easier
  ## handling within R
  
  names <- colnames(sensorData)
  
  for(i in 1:length(names)){
    ## Remove parentesis from names
    names[i] <- gsub("[(][)]", "", names[i])
    
    ## Convert to lower case
    #names[i] <- tolower(names[i])
    
    ## Replace hyphens with dot
    names[i] <- gsub("-", ".", names[i])
    
    ## Replace underscore with dot
    names[i] <- gsub("_", ".", names[i])
  }
  
  colnames(sensorData) <- names
  return(sensorData)
  
}

calcMean <- function(sensorData) {
  
  # Aggregate data by Subject and Activity using mean() function
  aggData <- aggregate(sensorData,list(Activity = sensorData$activity,                 
                       Subject = sensorData$subject), mean)
  
  ## Remove the two last columns (old activity + subject)
  aggData <- aggData[,1:(dim(aggData)[2]-2)]
  
  return(aggData)
}

addActivity <- function(sensorData) {
  
  ## File names
  testActFile <- paste(rootDir(), "test", "y_test.txt", sep="/")
  trainActFile <- paste(rootDir(), "train", "y_train.txt", sep="/")
  labelFile <- paste(rootDir(), "activity_labels.txt", sep="/")
  
  ## Add activity information to data set
  colIdx <- dim(sensorData)[2]+1
  testAct <- read.table(testActFile)
  trainAct <- read.table(trainActFile)
  actAll <- rbind(testAct, trainAct)
  
  ## For the different activities, use
  ## readable names instead an integer
  labels <- read.table(labelFile)
  sensorData[,colIdx] <- apply(actAll, 1, function(x) labels[x,2])
  
  ## Set column name for the activity column
  colnames(sensorData)[colIdx] <- "activity"
  
  return(sensorData)
}

addSubject <- function(sensorData) {
  
  ## Calculate index of new column
  colIdx <- dim(sensorData)[2] + 1
  
  ## Files containing subject daa
  subTrain <- paste(rootDir(), "train", "subject_train.txt", sep="/")
  subTest <- paste(rootDir(), "test", "subject_test.txt", sep="/")
  
  ## Read the files, merge them and append to sensorData
  trainSub <- read.table(subTrain)
  testSub <- read.table(subTest)
  subAll <- rbind(testSub, trainSub)
  sensorData[,colIdx] <- subAll
  colnames(sensorData)[colIdx] <- "subject"
  return(sensorData)
  
}

rootDir <- function() {
  return("UCI HAR Dataset")
}

runAnalysis()