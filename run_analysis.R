# Coursera Getting and Cleaning Data - Course Project

# 1. Downloading and unzipping data:
# Download File
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip data
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# 2. Merge training and test sets

# Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# 3. Use descriptive activity names

# Assigning column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
      
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
      
colnames(activityLabels) <- c('activityId','activityType')

# Merging data into one set:
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

# Extract mean, std deviation
# Read column names:
colNames <- colnames(setAllInOne)

# Create vector for defining ID, mean and std deviation:
mean_std <- (grepl("activityId" , colNames) | 
                 grepl("subjectId" , colNames) | 
                 grepl("mean.." , colNames) | 
                 grepl("std.." , colNames) 
                 )

# Make Nesseary subset:
setForMeanStd <- setAllInOne[ , mean_std == TRUE]

# 4. Descriptive variable names

# Name the activities:
setWithActivityNames <- merge(setForMeanStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# 5. Create a second tidy data set

# Make second tidy data set:
TidyData <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidyData <- TidyData[order(TidyData$subjectId, TidyData$activityId),]


# Write to test file:
write.table(secTidySet, "TidyData.txt", row.name=FALSE)
