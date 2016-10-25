
# Getting and Cleaning Data - Course Project

This repository hosts the codebook and R scripts for week4 assignment on  "Getting and Cleaning data".


Original datasets have been downloaded from the site
* Human Activity Recognition Using Smartphones (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# The script run_analysis.R does the following -

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive activity names.
5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Files and their definitions


1. ./test/X_test.txt   : Activity measures of test group
2. ./train/X_train.txt : Activity measures of training group
3. ./test/y_test.txt   : Activity id for each activity Type for test group
4. ./train/y_train.txt : Activity id for each activity type for train group
5. ./test/subject_test.txt : Subject Id for test group
6. ./train/subject_train.txt : Subject Id for Train group
7. ./features.txt            : Name of Activity Measures
8. ./activity_labels.txt     : Label for each Activity ("Walking","Standing"...)


# Process

* Step 1 : Test and Train data are merged into a single dataset.
* Step 2 : creata a new dataset to filter out any records in feature names that are ened with either "mean" or "Std" 
* Step 3 : Using last dataset as the index, filtered out all fields from the combined dataset (test and train) that are ended with "mean" or "std"

* Step 4 : Merge the Subject, Activity and filtered out measurements
* Step 5 : Create a new datasets with averages of all measurements. Use subjects and activity as the group by columns
* Step 6 : Create a text file dfaggregate.txt from the last dataset

# Output

 The output of this script a tidy dataset dfaggregate.txt. This file keeps average of all activity measures that ended with "mean" and "std" across subject and activity.

