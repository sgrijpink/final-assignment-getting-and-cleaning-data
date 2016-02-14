library(dplyr)
library(readr)

baseDir  <- "UCI\ HAR\ Dataset"
testDir  <- file.path(baseDir, "test")
trainDir <- file.path(baseDir, "train")

# functions
# =========
downloadAndUnzipDataFile <- function() {
  destfile <- "data.zip"
  if (!file.exists(destfile)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = destfile, method = "curl")
    unzip(destfile)
  }
}

loadAndMergeData <- function() {
  if (exists("accelerometerData")) { return() }
  
  featuresFile     <- file.path(baseDir, "features.txt")
  
  subjectTestFile  <- file.path(testDir,  "subject_test.txt")
  xTestFile        <- file.path(testDir,  "X_test.txt")
  yTestFile        <- file.path(testDir,  "y_test.txt")
  subjectTrainFile <- file.path(trainDir, "subject_train.txt")
  xTrainFile       <- file.path(trainDir, "X_train.txt")
  yTrainFile       <- file.path(trainDir, "y_train.txt")
  
  features <- read_delim(featuresFile, delim = " ", col_names = c("id", "feature")) %>%
    mutate(feature = paste(id, gsub(",", "_", feature), sep = "_"))
  
  print("Organise test dataset")
  subjectTest <- read_table(subjectTestFile, col_names = c("subject"))
  xTest       <- read_table(xTestFile,       col_names = features$feature)
  yTest       <- read_table(yTestFile,       col_names = c("activity"))
  
  testData <- cbind(xTest, subjectTest)
  testData <- cbind(testData, yTest)
  
  print("Organise train dataset")
  subjectTrain <- read_table(subjectTrainFile, col_names = c("subject"))
  xTrain       <- read_table(xTrainFile,       col_names = features$feature)
  yTrain       <- read_table(yTrainFile,       col_names = c("activity"))
  
  trainData <- cbind(xTrain, subjectTrain)
  trainData <- cbind(trainData, yTrain)
  
  print("Merge datasets")
  accelerometerData <<- tbl_df(rbind(testData, trainData))
}

loadFeatureData <- function() {
  activities <<- read_table(file.path(baseDir, "activity_labels.txt"), col_names = c("id", "activity"))
}

cleanVariableName <- function(variableName) {
  variableName <- sub("^[0-9]*_", "", variableName)
  variableName <- sub("^t", "time", variableName)
  variableName <- sub("^f", "frequency", variableName)
  variableName <- sub("Acc", "Accelerometer", variableName)
  variableName <- sub("Gyro", "Gyroscope", variableName)
  variableName <- sub("Mag", "Magnitude", variableName)
  variableName <- sub("BodyBody", "Body", variableName)
  variableName <- sub("\\(\\)", "", variableName)

  return(variableName)
  
}

# script
# ======

downloadAndUnzipDataFile()

# 1. Merges the training and the test sets to create one data set.

loadAndMergeData()

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

accelerometerData <- select(accelerometerData, subject, activity, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read_table("UCI HAR Dataset/activity_labels.txt", col_names = c("id", "activity")) %>%
  mutate(activity = tolower(activity))

accelerometerData <- mutate(accelerometerData, activity = activities$activity[activity])

# 4. Appropriately labels the data set with descriptive variable names.



# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.






