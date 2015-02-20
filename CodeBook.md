This project collected and summarized the data from the UCI Machine Learning Repository on smartphone readings 
on 30 subjects while performing 6 different daily activities.

From the UCI Machine Learning Repository Website:
The smartphone recoded "3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz...
using its embedded accelerometer and gyroscope".
"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have 
only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain."
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a 
constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz."
"Subsequently, the body linear acceleration and angular velocity were derived in time to obtain 
Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag)."
"Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to 
indicate frequency domain signals)."

For each of these variables, mean and standard deviation were calculated.

This is the final list of variables for which mean and standard deviation was calculated 
(X, Y, or Z in the variable label in the dataset indicates the direction in which the measurement was taken):
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

After running this runAnalysis.R script you will have a 180 by 68 tidy dataset.  
This data set is composed of the following data:

Columns 1 and 2 - Subject and Activity Type give each subject's ID and the type of activity in which they were 
engaged while carrying the smartphone.

Columns 3 through 68 - These are the mean and standard of each of the features calculated by the researchers 
listed above.  The mean for each of these calculated mean or standard variables is given in the tidy dataset.

The original data source can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
