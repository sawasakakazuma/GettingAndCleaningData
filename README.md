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
