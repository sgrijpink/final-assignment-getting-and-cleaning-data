library(dplyr)
library(readr)

# STEP 0. Download the data sets (if neccessary).

destfile <- "data.zip"
if (!file.exists(destfile)) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = destfile, method = "curl")
  unzip(destfile)
}

# STEP 1. Merge the training and the test sets to create one data set.

baseDir  <- "UCI\ HAR\ Dataset"
testDir  <- file.path(baseDir, "test")
trainDir <- file.path(baseDir, "train")

features <- read_delim(file.path(baseDir, "features.txt"), delim = " ", col_names = c("id", "feature"))

# Work around for duplicated column names
features <- mutate(features, feature = paste(id, gsub(",", "_", feature), sep = "_"))

print("Construct complete test data set")
subjectTest <- read_table(file.path(testDir,  "subject_test.txt"), col_names = c("subject"))
xTest       <- read_table(file.path(testDir,  "X_test.txt"),       col_names = features$feature)
yTest       <- read_table(file.path(testDir,  "y_test.txt"),       col_names = c("activity"))

testData <- cbind(xTest, subjectTest, yTest)

print("Construct complete train data set")
subjectTrain <- read_table(file.path(trainDir, "subject_train.txt"), col_names = c("subject"))
xTrain       <- read_table(file.path(trainDir, "X_train.txt"),       col_names = features$feature)
yTrain       <- read_table(file.path(trainDir, "y_train.txt"),       col_names = c("activity"))

trainData <- cbind(xTrain, subjectTrain, yTrain)

# Merge datasets
accelerometerData <- tbl_df(rbind(testData, trainData))

# STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.

accelerometerData <- select(accelerometerData, subject, activity, contains("mean"), contains("std"), -contains("angle"))

# STEP 3. Uses descriptive activity names to name the activities in the data set

activities <- read_table(file.path(baseDir, "activity_labels.txt"), col_names = c("id", "activity"))
accelerometerData <- mutate(accelerometerData, activity = activities$activity[activity])

# STEP 4. Appropriately labels the data set with descriptive variable names.

names(accelerometerData) <- lapply(names(accelerometerData), function(variable) {
  variable <- sub("^[0-9]*_", "", variable)
  variable <- sub("^t", "time", variable)
  variable <- sub("^f", "frequency", variable)
  variable <- sub("Acc", "Accelerometer", variable)
  variable <- sub("Gyro", "Gyroscope", variable)
  variable <- sub("Mag", "Magnitude", variable)
  variable <- sub("BodyBody", "Body", variable)
  variable <- sub("\\(\\)", "", variable)
  variable <- sub("-X", "X", variable)
  variable <- sub("-Y", "Y", variable)
  variable <- sub("-Z", "Z", variable)
  variable <- sub("-std", "Std", variable)
  variable <- sub("-mean", "Mean", variable)
  
  # lower case first letter of the variable name
  s <- strsplit(variable, " ")[[1]]
  paste0(tolower(substring(s, 1, 1)), substring(s, 2))
})

# STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

print("Create new tidy data set with averages")
tidy <- accelerometerData %>% group_by(activity, subject) %>% summarise_each(funs(mean))

write.table(tidy, "tidy.txt", row.names=FALSE)


