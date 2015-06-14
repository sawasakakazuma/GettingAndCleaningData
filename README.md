# GettingAndCleaningData

## How the script works
Basically, the script goes along with the five steps given by the instractor.
From now on, we'll elucidate it step by step.
Note that it uses `dplyr` package to make it easier to manipulate data.

1. *Merges the training and the test sets to create one data set.*  
It reads the training and test sets from the local files, and merges them into a local variable `data`.

2. *Extracts only the measurements on the mean and standard deviation for each measurement.*  
It first assigns appropriate names to the columns of `data`.
These names are obtained from "features.txt". 
Then it obtains indices of the columns whose name has "mean" or "std" substring.
Only the columns corresponding to those indices are extracted from `data` and named `extractedData`.

3. *Uses descriptive activity names to name the activities in the data set.*  
It first reads activity IDs from "y_*" files and appends them to `extractedData` as a new column.
Then, in order to obtain a list of descriptive activity names, it reads "activity_labels.txt" file.
`extractedData` and the descriptive activity names are merged to `mergedData`.

4. *Appropriately labels the data set with descriptive variable names.*  
This step has already been done in Step 2.

5. *From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*  
Because the subject data are required here, it reads them from "subject_*.txt" files and append them to `mergedData` as a new column.
Then it calculates the average value of each column for each activity and each subject by using both `group_by` and `summarise_each` functions of `dplyr` package and stores the result to a local variable `summary`.

Finally, it writes the tidy data set (`summary`) to a file using `write.table` function.

## Code book
| Variable name | Description |
| --- | --- |
| ActivityID | Identifier of the activities |
| ActivityLabel | A descriptive name of the activities |
| Subject | Identifier of the subjects |
| tBodyAcc-mean()-X | Mean value of the X-axis body accellaration |
| tBodyAcc-mean()-Y | Mean value of the Y-axis body accellaration |
| tBodyAcc-mean()-Z | Mean value of the Z-axis body accellaration |
| tBodyAcc-std()-X | Standard deviation of the X-axis body accellaration |
| tBodyAcc-std()-Y | Standard deviation of the Y-axis body accellaration |
| tBodyAcc-std()-Z | Standard deviation of the Z-axis body accellaration |
| tGravityAcc-mean()-X | Mean value of the X-axis gravity accellaration |
| tGravityAcc-mean()-Y | Mean value of the Y-axis gravity accellaration |
| tGravityAcc-mean()-Z | Mean value of the Z-axis gravity accellaration |
| tGravityAcc-std()-X | Standard deviation of the X-axis gravity accellaration |
| tGravityAcc-std()-Y | Standard deviation of the Y-axis gravity accellaration |
| tGravityAcc-std()-Z | Standard deviation of the Z-axis gravity accellaration |
| tBodyAccJerk-mean()-X | Mean value of the X-axis Jerk signals of body accellaration |
| tBodyAccJerk-mean()-Y | Mean value of the Y-axis Jerk signals of body accellaration |
| tBodyAccJerk-mean()-Z | Mean value of the Z-axis Jerk signals of body accellaration |
| tBodyAccJerk-std()-X | Standard deviation of the X-axis Jerk signals of body accellaration |
| tBodyAccJerk-std()-Y | Standard deviation of the Y-axis Jerk signals of body accellaration |
| tBodyAccJerk-std()-Z | Standard deviation of the Z-axis Jerk signals of body accellaration |
| tBodyGyro-mean()-X | Mean value of the X-axis body velocity |
| tBodyGyro-mean()-Y | Mean value of the Y-axis body velocity |
| tBodyGyro-mean()-Z | Mean value of the Z-axis body velocity |
| tBodyGyro-std()-X | Standard deviation of the X-axis body velocity |
| tBodyGyro-std()-Y | Standard deviation of the Y-axis body velocity |
| tBodyGyro-std()-Z | Standard deviation of the Z-axis body velocity |
| tBodyGyroJerk-mean()-X | Mean value of the X-axis Jerk signals of body velocity |
| tBodyGyroJerk-mean()-Y | Mean value of the Y-axis Jerk signals of body velocity |
| tBodyGyroJerk-mean()-Z | Mean value of the Z-axis Jerk signals of body velocity |
| tBodyGyroJerk-std()-X | Standard deviation of the X-axis Jerk signals of body velocity |
| tBodyGyroJerk-std()-Y | Standard deviation of the Y-axis Jerk signals of body velocity |
| tBodyGyroJerk-std()-Z | Standard deviation of the Z-axis Jerk signals of body velocity |
| tBodyAccMag-mean() | Mean value of the magnitude of body accellaration |
| tBodyAccMag-std() | Standard deviation of the magnitude of body accellaration |
| tGravityAccMag-mean() | Mean value of the magnitude of gravity accellaration |
| tGravityAccMag-std() | Standard deviation of the magnitude of gravity accellaration |
| tBodyAccJerkMag-mean() | Mean value of the magnitude of Jerk signals of body accellaration |
| tBodyAccJerkMag-std() | Standard deviation of the magnitude of Jerk signals of body accellaration |
| tBodyGyroMag-mean() | Mean value of the magnitude of body velocity |
| tBodyGyroMag-std() | Standard deviarion of the magnitude of body velocity |
| tBodyGyroJerkMag-mean() | Mean value of the magnitude of Jerk signals of body velocity |
| tBodyGyroJerkMag-std() | Standard deviarion of the magnitude of Jerk signals of body velocity |
| fBodyAcc-mean()-X | Mean value of the frequency of X-axis body accellaration |
| fBodyAcc-mean()-Y | Mean value of the frequency of Y-axis body accellaration |
| fBodyAcc-mean()-Z | Mean value of the frequency of Z-axis body accellaration |
| fBodyAcc-std()-X | Standard deviarion of the frequency of X-axis body accellaration |
| fBodyAcc-std()-Y | Standard deviarion of the frequency of Y-axis body accellaration |
| fBodyAcc-std()-Z | Standard deviarion of the frequency of Z-axis body accellaration |
| fBodyAccJerk-mean()-X | Mean value of the frequency of X-axis Jerk signals of body accellaration |
| fBodyAccJerk-mean()-Y | Mean value of the frequency of Y-axis Jerk signals of body accellaration |
| fBodyAccJerk-mean()-Z | Mean value of the frequency of Z-axis Jerk signals of body accellaration |
| fBodyAccJerk-std()-X | Standard deviation of the frequency of X-axis Jerk signals of body accellaration |
| fBodyAccJerk-std()-Y | Standard deviation of the frequency of Y-axis Jerk signals of body accellaration |
| fBodyAccJerk-std()-Z | Standard deviation of the frequency of Z-axis Jerk signals of body accellaration |
| fBodyGyro-mean()-X | Mean value of the frequency of X-axis body velocity |
| fBodyGyro-mean()-Y | Mean value of the frequency of Y-axis body velocity |
| fBodyGyro-mean()-Z | Mean value of the frequency of Z-axis body velocity |
| fBodyGyro-std()-X | Standard deviation of the frequency of X-axis body velocity |
| fBodyGyro-std()-Y | Standard deviation of the frequency of Y-axis body velocity |
| fBodyGyro-std()-Z | Standard deviation of the frequency of Z-axis body velocity |
| fBodyAccMag-mean() | Mean value of the frequency of the magnitude of body accellaration |
| fBodyAccMag-std() | Standard deviation of the frequency of the magnitude of body accellaration |
| fBodyBodyAccJerkMag-mean() | Mean value of the frequency of the magnitude of Jerk signals of body accellaration |
| fBodyBodyAccJerkMag-std() | Standard deviation of the frequency of the magnitude of Jerk signals of body accellaration |
| fBodyBodyGyroMag-mean() | Mean value of the frequency of the magnitude of body velocity |
| fBodyBodyGyroMag-std() | Standard deviation of the frequency of the magnitude of body velocity |
| fBodyBodyGyroJerkMag-mean() | Mean value of the frequency of the magnitude of Jerk signals of body velocity |
| fBodyBodyGyroJerkMag-std() | Standard deviation of the frequency of the magnitude of Jerk signals of body velocity |
