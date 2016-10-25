#Code Book for Data Cleaning project

# Original Files and Variables

Original datasets have been downloaded from the site
* Human Activity Recognition Using Smartphones (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

It's variables can be found here 
* (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


# New Variables and their types
 Subject                  : int  1 2 3 4 5 6 7 8 9 10 ...
 Activity                 : Factor w/ 6 levels "LAYING","SITTING",..:  
 tBodyAcc_Mean_X          : num   
 tBodyAcc_Mean_Y          : num  
 tBodyAcc_Mean_Z          : num  
 tBodyAcc_Std_X           : num  
 tBodyAcc_Std_Y           : num   
 tBodyAcc_Std_Z           : num   
 tGravityAcc_Mean_X       : num   
 tGravityAcc_Mean_Y       : num   
 tGravityAcc_Mean_Z       : num   
 tGravityAcc_Std_X        : num   
 tGravityAcc_Std_Y        : num  
 tGravityAcc_Std_Z        : num  
 tBodyAccJerk_Mean_X      : num    
 tBodyAccJerk_Mean_Y      : num  
 tBodyAccJerk_Mean_Z      : num   
 tBodyAccJerk_Std_X       : num   
 tBodyAccJerk_Std_Y       : num  
 tBodyAccJerk_Std_Z       : num   
 tBodyGyro_Mean_X         : num   
 tBodyGyro_Mean_Y         : num  
 tBodyGyro_Mean_Z         : num   
 tBodyGyro_Std_X          : num   
 tBodyGyro_Std_Y          : num   
 tBodyGyro_Std_Z          : num   
 tBodyGyroJerk_Mean_X     : num  
 tBodyGyroJerk_Mean_Y     : num   
 tBodyGyroJerk_Mean_Z     : num  
 tBodyGyroJerk_Std_X      : num   
 tBodyGyroJerk_Std_Y      : num  
 tBodyGyroJerk_Std_Z      : num   
 tBodyAccMag_Mean         : num   
 tBodyAccMag_Std          : num   
 tGravityAccMag_Mean      : num   
 tGravityAccMag_Std       : num   
 tBodyAccJerkMag_Mean     : num   
 tBodyAccJerkMag_Std      : num   
 tBodyGyroMag_Mean        : num   
 tBodyGyroMag_Std         : num   
 tBodyGyroJerkMag_Mean    : num   
 tBodyGyroJerkMag_Std     : num   
 fBodyAcc_Mean_X          : num   
 fBodyAcc_Mean_Y          : num  
 fBodyAcc_Mean_Z          : num  
 fBodyAcc_Std_X           : num  
 fBodyAcc_Std_Y           : num  
 fBodyAcc_Std_Z           : num 
 fBodyAccJerk_Mean_X      : num  
 fBodyAccJerk_Mean_Y      : num   
 fBodyAccJerk_Mean_Z      : num   
 fBodyAccJerk_Std_X       : num   
 fBodyAccJerk_Std_Y       : num   
 fBodyAccJerk_Std_Z       : num  
 fBodyGyro_Mean_X         : num   
 fBodyGyro_Mean_Y         : num   
 fBodyGyro_Mean_Z         : num   
 fBodyGyro_Std_X          : num  
 fBodyGyro_Std_Y          : num  
 fBodyGyro_Std_Z          : num  
 fBodyAccMag_Mean         : num  
 fBodyAccMag_Std          : num  
 fBodyBodyAccJerkMag_Mean : num  
 fBodyBodyAccJerkMag_Std  : num  
 fBodyBodyGyroMag_Mean    : num  
 fBodyBodyGyroMag_Std     : num  
 fBodyBodyGyroJerkMag_Mean: num  
 fBodyBodyGyroJerkMag_Std : num  


# Transformation
 Datasets for subjects, activity labels and activity measures are merged to create the tidy datasets. Out of 521 different activities, only 66 of them that are ended with "mean" and "std" are taken. The tidy dataset has been created by taking averages of these activities by subject and activity label. 

