Getting and Cleaning Data - Project 1
==============

### Study Design

This project aims at aggregating, simplifying and cleaning the raw data coming from the study "Human Activity Recognition Using Smartphones Dataset", version 1.0.

The raw data set contains data captured from a smartphone's accelerometer and gyroscope. The experiments have been performed with a group of 30 volounteers during different activities (sitting, walking, etc.). The result is a set of features showing acceleration, speed, etc. All features and the steps performed on the raw data set are described below in the chapter "Code Book".

The raw data set can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Code book

To create the tidy data set using the raw data, the function runAnalysis() should be executed. This function expects a sub directory named "UCI HAR Dataset" in the current working directory, containing the raw data set. This sub directory will be created when extracting the zip-file "UCI HAR Dataset.zip", which can be obtained from the URL mentioned in chapter "Study Design". A new tidy dataset will be created and saved in the current working directory, with the file name "tidy.txt".

The function runAnalysis will perform the following modifications to the raw data:

* Merge the training and test data sets - Training and test data are stored separately in the raw data set
* Only the features representing "standard deviation" and "mean" are kept in the tidy data set
* Add activity (sitting, lying, etc.) to the tidy data set - The raw data has the activity in a separate file
* Add the subject/person to each line of the tidy data set. That way each line can easily be tied to one of the 30 volounteers
* Aggregate the data per activity and subject, using the mean-function. Meaning, each subject will have as many lines in the file as activities, each showing the mean of all measurements for that particular subject/activity combination.
* To simplify usage of the tidy data set, the column headers names are adjusted. All parenthesis "()" are removed and dashes and underscores "-" "_" replaced with dots ".".

### Features

 [1] "Activity"                  "Subject"                  
 [3] "tBodyAcc.mean.X"           "tBodyAcc.mean.Y"          
 [5] "tBodyAcc.mean.Z"           "tGravityAcc.mean.X"       
 [7] "tGravityAcc.mean.Y"        "tGravityAcc.mean.Z"       
 [9] "tBodyAccJerk.mean.X"       "tBodyAccJerk.mean.Y"      
[11] "tBodyAccJerk.mean.Z"       "tBodyGyro.mean.X"         
[13] "tBodyGyro.mean.Y"          "tBodyGyro.mean.Z"         
[15] "tBodyGyroJerk.mean.X"      "tBodyGyroJerk.mean.Y"     
[17] "tBodyGyroJerk.mean.Z"      "tBodyAccMag.mean"         
[19] "tGravityAccMag.mean"       "tBodyAccJerkMag.mean"     
[21] "tBodyGyroMag.mean"         "tBodyGyroJerkMag.mean"    
[23] "fBodyAcc.mean.X"           "fBodyAcc.mean.Y"          
[25] "fBodyAcc.mean.Z"           "fBodyAccJerk.mean.X"      
[27] "fBodyAccJerk.mean.Y"       "fBodyAccJerk.mean.Z"      
[29] "fBodyGyro.mean.X"          "fBodyGyro.mean.Y"         
[31] "fBodyGyro.mean.Z"          "fBodyAccMag.mean"         
[33] "fBodyBodyAccJerkMag.mean"  "fBodyBodyGyroMag.mean"    
[35] "fBodyBodyGyroJerkMag.mean" "tBodyAcc.std.X"           
[37] "tBodyAcc.std.Y"            "tBodyAcc.std.Z"           
[39] "tGravityAcc.std.X"         "tGravityAcc.std.Y"        
[41] "tGravityAcc.std.Z"         "tBodyAccJerk.std.X"       
[43] "tBodyAccJerk.std.Y"        "tBodyAccJerk.std.Z"       
[45] "tBodyGyro.std.X"           "tBodyGyro.std.Y"          
[47] "tBodyGyro.std.Z"           "tBodyGyroJerk.std.X"      
[49] "tBodyGyroJerk.std.Y"       "tBodyGyroJerk.std.Z"      
[51] "tBodyAccMag.std"           "tGravityAccMag.std"       
[53] "tBodyAccJerkMag.std"       "tBodyGyroMag.std"         
[55] "tBodyGyroJerkMag.std"      "fBodyAcc.std.X"           
[57] "fBodyAcc.std.Y"            "fBodyAcc.std.Z"           
[59] "fBodyAccJerk.std.X"        "fBodyAccJerk.std.Y"       
[61] "fBodyAccJerk.std.Z"        "fBodyGyro.std.X"          
[63] "fBodyGyro.std.Y"           "fBodyGyro.std.Z"          
[65] "fBodyAccMag.std"           "fBodyBodyAccJerkMag.std"  
[67] "fBodyBodyGyroMag.std"      "fBodyBodyGyroJerkMag.std" 


"Each variable and its units"


