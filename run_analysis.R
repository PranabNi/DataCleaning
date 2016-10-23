setwd("c:/datascience");
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="TestResult.zip")
unzip("TestResult.zip",exdir="c:/datascience/TestResult")



## Load Test and Train Data into respective Dataframe
setwd("c:/datascience/TestResult/UCI HAR Dataset");


################################################################
## Step 1 : Load and Combine Test and Train Datasets          ##
################################################################

## use sep="" for one or more white spaces
dfXtest  <- read.csv("./test/X_test.txt",sep="", header=FALSE);
dfXtrain <- read.csv("./train/X_train.txt",sep="", header=FALSE);

dfYtest <- read.csv("./test/Y_test.txt",sep="", header=FALSE);
dfYtrain <- read.csv("./train/Y_train.txt",sep="", header=FALSE);

##Read the Subject files

dfSubjecttest <- read.csv("./test/subject_test.txt",sep="", header=FALSE);
dfsubjecttrain <- read.csv("./train/subject_train.txt",sep="", header=FALSE);


## Combine Test and Train data

## _X_ dataset has the actual measurement data. Its column labels are stored in the feature.txt

dfXCombine       <- rbind(dfXtest, dfXtrain)

#####################################################################
## Step 1a. Load Activity Labels Subjects and Features             ##
#####################################################################

## _Y_ is the activity index 1..6; it's label is in activity_label.txt

dfYCombine       <- rbind(dfYtest, dfYtrain)

## This keeps the people that took the test. Person's are numbered 1..30.

dfSubjectCombine <- rbind(dfSubjecttest, dfsubjecttrain)

names(dfSubjectCombine) <- c("Subject")

## View the combined Results
## head(dfXCombine,10)
## head(dfYCombine,10)
## head(dfSubjectCombine,10)

## Read Feature dataset

dfFeature <- read.csv("./features.txt",sep="", header=FALSE);

## Read the activity 

dfActivityLabel  <- read.csv("./activity_labels.txt",sep="", header=FALSE);

###############################################################################
## Step 2: Extracts only the measurements on the mean and standard deviation ##
## for each measurement.                                                     ##
###############################################################################

## dfFeatures keeps the column names in the row level of the measurement dataset
## dfXCombine. We will first filter the column name in dfFeature dataset. Then
## filters the filtered columns from dfXCombine.

## Filter the values that has mean() and std() in their names

dfFilteredFeatures <- grep("-mean\\(\\)|-std\\(\\)",dfFeature$V2)

## now dfFilteredFeatures has only those columns I am interested in dfXCombine

dfMeasurement <- dfXCombine[,dfFilteredFeatures]

## Use Feature name as the column names of the measurements
names(dfMeasurement) <- dfFeature$V2[dfFilteredFeatures]



## Check the number of columns in dfMeasurement. It should have 66 columns
## dim(dfMeasurement)

##################################################################################
# Step3: Uses descriptive activity names to name the activities in the data set ##
##################################################################################



## Merge Activity (dfYCombine) and its label dfActivityLabel

## create a single dataset with activity and activity label

dfActivity <- merge(dfYCombine,dfActivityLabel, by.x="V1", by.y = "V1" )

## Rename its column

 names(dfActivity) <- c("Activity_id","Activity")
 
##dfActivity <- dfActivity$Activity
##names(dfActivity) <- c("Activity")


##################################################################################
# Step 4: Appropriately labels the data set with descriptive variable names.     ##
##################################################################################


## Change the Columns in dfXcombine. Change -mean()-X to _Mean_X. Do same for std

dfnames <- dfFeature$V2[dfFilteredFeatures]

dfnames <- gsub("mean\\(\\)","Mean",dfnames)
dfnames <- gsub("std\\(\\)","Std",dfnames)
dfnames <- gsub("-","_",dfnames)


names(dfMeasurement) <-dfnames


# Merge Subject, Activity and Measurements in that order

dfMeasurement <- cbind(dfSubjectCombine, dfActivity$Activity, dfMeasurement)
names(dfMeasurement)[2] = "Activity"



## Create the aggrgate Dataset ; Group by Subject and Activity

dfaggregate <- aggregate(dfMeasurement[,3:length(names(dfMeasurement))], by=list(dfMeasurement$Subject,dfMeasurement$Activity), FUN="mean")

## Group by column names changed. 
names(dfaggregate)[1] <- "Subject"
names(dfaggregate)[2] <- "Activity"

## Create a file 
filename <- file("dfaggregate.txt","w+")
write.table(dfaggregate, filename, row.names = FALSE)
close(filename)