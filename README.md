Getting and Cleaning Data - Project 1
==============

### Introduction

This project aims at aggregating, simplifying and cleaning the raw data coming from the study "Human Activity Recognition Using Smartphones Dataset", version 1.0.

The raw data set contains data captured from a smartphone's accelerometer and gyroscope. The experiments have been performed with a group of 30 volounteers during different activities (sitting, walking, etc.). The result is a set of features showing acceleration, speed, etc. All features and the steps performed on the raw data set are described below in the chapter "Code Book".

The raw data set can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Study Design

To create the tidy data set using the raw data, the function runAnalysis() should be executed. This function expects a sub directory named "UCI HAR Dataset" in the current working directory, containing the raw data set. This sub directory will be created when extracting the zip-file "UCI HAR Dataset.zip", which can be obtained from the URL mentioned in chapter "Study Design". A new tidy dataset will be created and saved in the current working directory, with the file name "tidy.txt".

The function runAnalysis will perform the following modifications to the raw data:

* Merge the training and test data sets - Training and test data are stored separately in the raw data set
* Only the features representing "standard deviation" and "mean" are kept in the tidy data set
* Add activity (sitting, lying, etc.) to the tidy data set - The raw data has the activities in a separate file
* Add the subject/person to each line of the tidy data set. That way each line can easily be tied to one of the 30 volounteers
* Aggregate the data per activity and subject, using the mean-function. As a result each subject will have as many lines in the file as activities, each showing the mean of all measurements for that particular subject/activity combination over the complete time series.
* To simplify usage of the tidy data set, the column headers names are adjusted. All parenthesis "()" are removed and dashes and underscores "-" "_" replaced with dots ".".

### Code book

#### Features

* Activity - A charachter string indicating the current activity. One of: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

* Subject - An integer indicating which person who performed the experiment

* Column 3-68 - Contains numeric measurements normalized to a value between [-1,1], each described by their column name using the following conventions:

  * "t" - Time series measurement (note that in the tidy data set the series has been aggregated, see Code Book)
  
  * "Acc" - Measurement coming from the accelerometer
  
  * "Gyro" - Measurement coming from the gyroscope
  
  * "Body"/"Gravity" - Body or Gravity measurement that were separated from the accelerometer measurement using a low pass Butterworth filter with a corner frequency of 0.3 Hz.
  
  * "X"/"Y"/"Z" - Denotes the axis of the measurement
  
  * "Jerk" - The jerk signal, derived from body acceleration and angular velocity
  
  * "f" - The result of applying a Fast Fourier Transform (FFT) to the measurment
  
  * "mean" - The average value over the complete time series for that subject and activity
  
  * "std" - The average standard deviation over the complete time series for that subject and activity

#### Full List of Features

1. Activity
2. Subject
3. tBodyAcc.mean.X
4. tBodyAcc.mean.Y
5. tBodyAcc.mean.Z
6. tGravityAcc.mean.X
7. tGravityAcc.mean.Y
8. tGravityAcc.mean.Z
9. tBodyAccJerk.mean.X
10. tBodyAccJerk.mean.Y
11. tBodyAccJerk.mean.Z
12. tBodyGyro.mean.X
13. tBodyGyro.mean.Y
14. tBodyGyro.mean.Z
15. tBodyGyroJerk.mean.X
16. tBodyGyroJerk.mean.Y
17. tBodyGyroJerk.mean.Z
18. tBodyAccMag.mean
19. tGravityAccMag.mean
20. tBodyAccJerkMag.mean
21. tBodyGyroMag.mean
22. tBodyGyroJerkMag.mean
23. fBodyAcc.mean.X
24. fBodyAcc.mean.Y
25. fBodyAcc.mean.Z
26. fBodyAccJerk.mean.X
27. fBodyAccJerk.mean.Y
28. fBodyAccJerk.mean.Z
29. fBodyGyro.mean.X
30. fBodyGyro.mean.Y
31. fBodyGyro.mean.Z
32. fBodyAccMag.mean
33. fBodyBodyAccJerkMag.mean
34. fBodyBodyGyroMag.mean
35. fBodyBodyGyroJerkMag.mean
36. tBodyAcc.std.X
37. tBodyAcc.std.Y
38. tBodyAcc.std.Z
39. tGravityAcc.std.X
40. tGravityAcc.std.Y
41. tGravityAcc.std.Z
42. tBodyAccJerk.std.X
43. tBodyAccJerk.std.Y
44. tBodyAccJerk.std.Z
45. tBodyGyro.std.X
46. tBodyGyro.std.Y
47. tBodyGyro.std.Z
48. tBodyGyroJerk.std.X
49. tBodyGyroJerk.std.Y
50. tBodyGyroJerk.std.Z
51. tBodyAccMag.std
52. tGravityAccMag.std
53. tBodyAccJerkMag.std
54. tBodyGyroMag.std
55. tBodyGyroJerkMag.std
56. fBodyAcc.std.X
57. fBodyAcc.std.Y
58. fBodyAcc.std.Z
59. fBodyAccJerk.std.X
60. fBodyAccJerk.std.Y
61. fBodyAccJerk.std.Z
62. fBodyGyro.std.X
63. fBodyGyro.std.Y
64. fBodyGyro.std.Z
65. fBodyAccMag.std
66. fBodyBodyAccJerkMag.std
67. fBodyBodyGyroMag.std
68. fBodyBodyGyroJerkMag.std
