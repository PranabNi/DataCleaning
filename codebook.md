# Files and their definitions

A number of measures of activity results of 30 people ( divided into two groups test and train) are stored into two different files. This FR scripts merge, label them and at the end a new tidy data set of average of each meausre are created in a single tidy data set. 

Files are downloaded from 
* Human Activity Recognition Using Smartphones (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) site.

# Variables


* dfXtest  : Dataset for X_test.txt
* dfXtrain : Dataset for X_train.txt

* dfFeature : Dataset for the field names of the X_test and X_train datasets

* dfYtest  : Dataset for Y_test.txt
* dfYtrain : Dataset for Y_train.txt

* dfSubjecttest  : Dataset for subject_test.txt
* dfsubjecttrain : Dataset for subject_train.txt

* dfActivityLabel  : Dataset for Activity_labels.txt

# Transformation

* Step 1 : Test and Train data are merged into a single dataset.
* Step 2 : creata a new dataset dfFilteredFeatures to filter out any records in feature names (dfFeature) that are ened with either "mean" or "Std" 
* Step 3 : Using dfFilteredFeatures as the index filtered out all fields from dfXcombine that are ended with "mean" or "std"

* Step 4 : Merge the Subject, Activity and filterout measurements
* Step 5 : Create a new datasets with averages of all measurements. Use subjects and activity as the group by columns
* Step 6 : Create a text file dfaggregate.txt from the last dataset

