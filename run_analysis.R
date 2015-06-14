library(dplyr)

# 1. Merges the training and the test sets to create one data set.
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
data <- rbind(trainData, testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt")
names(data) <- features$V2
indices <- sort(grep("(mean|std)\\(\\)", names(data)))
extractedData <- data[, indices]

# 3. Uses descriptive activity names to name the activities in the data set.
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
extractedData$ActivityID <- rbind(trainActivity, testActivity)$V1

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activityLabels) <- c("ActivityID", "ActivityLabel")
mergedData <- merge(extractedData, activityLabels, all=TRUE)

# 4. Appropriately labels the data set with descriptive variable names.
#We have already done in Step 2.

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
mergedData$Subject <- rbind(trainSubject, testSubject)$V1

groupData <- group_by(mergedData, ActivityID, ActivityLabel, Subject)
summary <- summarise_each(groupData, funs(mean))

# Write the tidy data set to a file.
write.table(summary, file="result.txt", row.name=FALSE)