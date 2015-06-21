#Code Book for Getting and Cleaning Data Project

This code book describes the variables contained within the "tidy_table" file.
The original source data is from an experiment where a number of subjects each carried out a number of activities. During the activities the subjects wore a smart phone. Measurements from its embedded accelerometer and gyroscope where recorded. The feature variable values in "tidy_table" are the average of these measurements for each subject/activity combination


##The variable "subject_id"
Type - Factor with 30 layers, 1 2 3 4 5 6...28 29 30
Each layer corresponds to one of the 30 subjects who took part in the experiment.  

##The variable "activity"
Type - Factor with 6 layers, "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS", 
Each layer corresponds to one of the six activities that each subject performed during the experiment


##Feature Variables
All the following feature variables are of: 
Type - num normalised and bounded within [-1,1]
Each feature corresponds to the average measurement for each subject for each activity in the experiment. 

###The variable "tbodyacc.mean.x"
Represents the body x axis angular velocity means.
Units are radians/second

###The variable "tbodyacc.mean.y"
Represents the body y axis angular velocity means.
Units are radians/second

###The variable "tbodyacc.mean.z"
Represents the body z axis angular velocity means.
Units are radians/second

###The variable "tbodyacc.std.x"
Represents the body x axis angular velocity standard deviations.

###The variable "tbodyacc.std.y"
Represents the body y axis angular velocity standard deviations.

###The variable "tbodyacc.std.z"
Represents the body y axis angular velocity standard deviations.

###The variable "tgravityacc.mean.x"
Represents the x axis gravity means.
Units are 'g'

###The variable "tgravityacc.mean.y"
Represents the y axis gravity means.
Units are 'g'

###The variable "tgravityacc.mean.z"
Represents the z axis gravity means.
Units are 'g'

###The variable "tgravityacc.std.x"
Represents the x axis gravity standard deviations.

###The variable "tgravityacc.std.y"
Represents the y axis gravity standard deviations.

###The variable "tgravityacc.std.z"
Represents the z axis gravity standard deviations.

###The variable "tbodyaccjerk.mean.x"
Represents the derived body x axis jerk signal means. 

###The variable "tbodyaccjerk.mean.y"
Represents the derived body y axis jerk signal means.
 
###The variable "tbodyaccjerk.mean.z"
Represents the derived body z axis jerk signal means.

###The variable "tbodyaccjerk.std.x"
Represents the derived x axis jerk signal standard deviations. 

###The variable "tbodyaccjerk.std.y"
Represents the derived y axis jerk signal standard deviations. 

###The variable "tbodyaccjerk.std.z"
Represents the derived z axis jerk signal standard deviations. 

###The variable "tbodygyro.mean.x"
Represents the gyro x axis angular velocity means.
Units are radians/second 

###The variable "tbodygyro.mean.y"
Represents the gyro y axis angular velocity means.
Units are radians/second 

###The variable "tbodygyro.mean.z"
Represents the gyro z axis angular velocity means.
Units are radians/second 

###The variable "tbodygyro.std.x"
Represents the gyro x axis angular velocity standard deviations.

###The variable "tbodygyro.std.y"
Represents the gyro y axis angular velocity standard deviations.

###The variable "tbodygyro.std.z"
Represents the gyro z axis angular velocity standard deviations.

###The variable "tbodygyrojerk.mean.x"
Represents the derived gyro x axis jerk signal means. 

##The variable "tbodygyrojerk.mean.y"
Represents the derived gyro y axis jerk signal means

###The variable "tbodygyrojerk.mean.z"
Represents the derived gyro z axis jerk signal means

###The variable "tbodygyrojerk.std.x"
Represents the derived gyro x axis jerk standard deviations.

###The variable "tbodygyrojerk.std.y"
Represents the derived gyro y axis jerk standard deviations.

###The variable "tbodygyrojerk.std.z"
Represents the derived gyro z axis jerk standard deviations.

###The variable "tbodyaccmag.mean"
Represents the derived body acceleration magnitude

###The variable "tbodyaccmag.std"
Represents the derived body acceleration magnitude standard deviation

###The variable "tgravityaccmag.mean"
Represents the derived gravity acceleration magnitude mean

###The variable "tgravityaccmag.std"
Represents the derived gravity acceleration magnitude standard deviation

###The variable "tbodyaccjerkmag.mean"
Represents the derived body jerk signal magnitude mean
 
###The variable "tbodyaccjerkmag.std"
Represents the derived body jerk signal standard deviation

###The variable "tbodygyromag.mean"
Represents the derived body gyro magnitude mean

###The variable "tbodygyromag.std"
Represents the derived body gyro magnitude standard deviation

###The variable "tbodygyrojerkmag.mean"
Represents the derived body gyro jerk magnitude mean

###The variable "tbodygyrojerkmag.std"
Represents the derived body gyro jerk magnitude standard deviation

###The variable fbodyacc.mean.x"
Represents the FFT body x axis acceleration mean

###The variable "fbodyacc.mean.y"
Represents the FFT body y axis acceleration mean

###The variable "fbodyacc.mean.z"
Represents the FFT body z axis acceleration mean

###The variable "fbodyacc.std.x"
Represents the FFT body x axis acceleraion standard deviation

###The variable "fbodyacc.std.y"
Represents the FFT body y axis acceleration standard deviation

###The variable "fbodyacc.std.z"
Represents the FFT body z axis acceleration standard deviation

###The variable "fbodyaccjerk.mean.x"
Represents the FFT body x axis jerk signal mean 

###The variable "fbodyaccjerk.mean.y"
Represents the FFT body y axis jerk signal mean

###The variable "fbodyaccjerk.mean.z"
Represents the FFT body z axis jerk signal mean

###The variable "fbodyaccjerk.std.x"
Represents the FFT body x axis jerk signal standard deviation
 
###The variable "fbodyaccjerk.std.y"
Represents the FFT body y axis jerk signal standard deviation

###The variable "fbodyaccjerk.std.z"
Represents the FFT body z axis jerk signal standard deviation

###The variable "fbodygyro.mean.x"
Represents the FFT x axis gyro mean

###The variable "fbodygyro.mean.y"
Represents the FFT y axis gyro mean

###The variable "fbodygyro.mean.z"
Represents the FFT z axis gyro mean

###The variable "fbodygyro.std.x"
Represents the FFT x axis gyro standard deviation

###The variable "fbodygyro.std.y"
Represents the FFT y axis gyro standard deviation

###The variable "fbodygyro.std.z"
Represents the FFT z axis gyro standard deviation

###The variable "fbodyaccmag.mean"
Represents the FFT body acceleration magnitude mean

###The variable "fbodyaccmag.std"
Represents the FFT body acceleration magnitude standard deviation
"
###The variable "fbodybodyaccjerkmag.mean"
Represents the FFT body jerk signal magnitude mean

###The variable "fbodybodyaccjerkmag.std"
Represents the FFT body jerk signal magnitude standard deviation

###The variable "fbodybodygyromag.mean"
Represents the FTT gyro magnitude mean

###The variable "fbodybodygyromag.std"
Represents the FTT gyro magnitude standard deviation

###The variable "fbodybodygyrojerkmag.mean"
Represents the gyro jerk magnitude mean

###The variable "fbodybodygyrojerkmag.std"
Represents the gyro jerk standard deviation

***Note: FTT - Fast Fourier Transform***