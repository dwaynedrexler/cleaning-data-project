Getting and Cleaning Data - Study Design and Project Code Book
=============================================
Author: Dwayne Drexler
----------------------
Project Submitted: February 22, 2015
------------------------------------


Study Design
============
The purpose of this study was to combine all of the data from the [Human Activity Recognition study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) into a single, tidy dataset and tabulate the means of each of the measurements that were mean and standard deviation measurements, on each subject and each activity.

I chose the wide-form format to construct the tidy data set.

**Averages were calculated on each measurement for each Subject performing each activity.**  The resulting data set is 180 rows x 68 columns.

Combining the data
------------------
All of the data were combined into a single dataset with the following steps:
  * Combined (row-wise) the training and test data for each of the three data files (subject, X, and y);
  * Combined (column-wise) each of the data sets;
  * Named the columns using the information in features.txt, provided in the raw data.

Filtering the data for the desired columns
------------------------------------------
The columns were filtered for only represented the mean and standard deviation for each measurement
  * Retrieved all of the column names that included the term "mean()" and "std()";
  * Subsetted the data set with only those columns;
  * Subsetted the data set again to eliminate columns that included the term "meanFreq".

Using descriptive activity names
--------------------------------
I replaced each item in the Activity column with its verbal meaning from the file "activity_labels.txt" in the provided data set.

Calculating the mean of each measurement by Activity, by Subject
----------------------------------------------------------------
The means of each measurement were calculated by the following steps:
  * Split the data into sets filtered by Subject;
  * Used the plyr library to summarize the means of each of the measurement fields grouped by Activity.


Feature Selection 
-----------------
From the group who performed the study I provide the following description of their data (note I have altered the actual variable names to be more human-readable):


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
  * tBodyAcc-XYZ
  * tGravityAcc-XYZ
  * tBodyAccJerk-XYZ
  * tBodyGyro-XYZ
  * tBodyGyroJerk-XYZ
  * tBodyAccMag
  * tGravityAccMag
  * tBodyAccJerkMag
  * tBodyGyroMag
  * tBodyGyroJerkMag
  * fBodyAcc-XYZ
  * fBodyAccJerk-XYZ
  * fBodyGyro-XYZ
  * fBodyAccMag
  * fBodyAccJerkMag
  * fBodyGyroMag
  * fBodyGyroJerkMag

The set of variables that were estimated from these signals are (limited to the data contained in this study): 
  * mean(): Mean value
  * std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
  * gravityMean
  * tBodyAccMean
  * tBodyAccJerkMean
  * tBodyGyroMean
  * tBodyGyroJerkMean



Code Book
=========

|  Variable Name                                        | Col |  Type    |  Value Range        |  Description                                               |
--------------------------------------------------------|-----|----------|-------------------  |------------------------------------------------------------|
|  Subject                                              |  1  |  factor  |  1:30               |  Subject measured in this observation                      |
|  Activity                                             |  2  |  factor  |  laying             |  Activity performed in this obeservation                   |
|                                                       |     |          |  sitting            |                                                            |
|                                                       |     |          |  standing           |                                                            |
|                                                       |     |          |  walking            |                                                            |
|                                                       |     |          |  walking_upstairs   |                                                            |
|                                                       |     |          |  walking_downstairs |                                                            |
|  Time_BodyAccelerometer_Mean_X                        |  3  |  numeric |  0.2216:0.3015      |  Mean of Body Accelerometer X Time means                   |
|  Time_BodyAccelerometer_Mean_Y                        |  4  |  numeric |  -0.0405:-0.0013    |  Mean of Body Accelerometer Y Time mean                    |
|  Time_BodyAccelerometer_Mean_Z                        |  5  |  numeric |  -0.1525:-0.0754    |  Mean of Body Accelerometer Z Time means                   |
|  Time_GravityAccelerometer_Mean_X                     |  6  |  numeric |  -0.68:0.9745       |  Mean of Gravity Accelerometer X Time means                |
|  Time_GravityAccelerometer_Mean_Y                     |  7  |  numeric |  -0.4799:0.9566     |  Mean of Gravity Accelerometer Y Time means                |
|  Time_GravityAccelerometer_Mean_Z                     |  8  |  numeric |  -0.4951:0.9579     |  Mean of Gravity Accelerometer Z Time means                |
|  Time_BodyAccelerometerJerk_Mean_X                    |  9  |  numeric |  0.0427:0.1302      |  Mean of Body Accelerometer Jerk X Time means              |
|  Time_BodyAccelerometerJerk_Mean_Y                    |  10 |  numeric |  -0.0387:0.0568     |  Mean of Body Accelerometer Jerk Y Time means              |
|  Time_BodyAccelerometerJerk_Mean_Z                    |  11 |  numeric |  -0.0675:0.0381     |  Mean of Body Accelerometer Jerk Z Time means              |
|  Time_BodyGyroscope_Mean_X                            |  12 |  numeric |  -0.2058:0.1927     |  Mean of Body Gyroscope X Time means                       |
|  Time_BodyGyroscope_Mean_Y                            |  13 |  numeric |  -0.2042:0.0275     |  Mean of Body Gyroscope Y Time means                       |
|  Time_BodyGyroscope_Mean_Z                            |  14 |  numeric |  -0.0725:0.1791     |  Mean of Body Gyroscope Z Time means                       |
|  Time_BodyGyroscopeJerk_Mean_X                        |  15 |  numeric |  -0.1572:-0.0221    |  Mean of Body Gyroscope Jerk X Time means                  |
|  Time_BodyGyroscopeJerk_Mean_Y                        |  16 |  numeric |  -0.0768:-0.0132    |  Mean of Body Gyroscope Jerk Y Time means                  |
|  Time_BodyGyroscopeJerk_Mean_Z                        |  17 |  numeric |  -0.0925:-0.0069    |  Mean of Body Gyroscope Jerk Z Time means                  |
|  Time_BodyAccelerometerMagnitude_Mean                 |  18 |  numeric |  -0.9865:0.6446     |  Mean of Body Accelerometer Magnitude Time means           |
|  Time_GravityAccelerometerMagnitude_Mean              |  19 |  numeric |  -0.9865:0.6446     |  Mean of Gravity Accelerometer Magnitude Time means        |
|  Time_BodyAccelerometerJerkMagnitude_Mean             |  20 |  numeric |  -0.9928:0.4345     |  Mean of Body Accelerometer Jerk Magnitude Time means      |
|  Time_BodyGyroscopeMagnitude_Mean                     |  21 |  numeric |  -0.9807:0.418      |  Mean of Body Gyroscope Magnitude Time means               |
|  Time_BodyGyroscopeJerkMagnitude_Mean                 |  22 |  numeric |  -0.9973:0.0876     |  Mean of Body Gyroscope Jerk Magnitude Time means          |
|  Fourier_BodyAccelerometer_Mean_X                     |  23 |  numeric |  -0.9952:0.537      |  Mean of FFT on Body Accelerometer X Time means            |
|  Fourier_BodyAccelerometer_Mean_Y                     |  24 |  numeric |  -0.989:0.5242      |  Mean of FFT on Body Accelerometer Y Time means            |
|  Fourier_BodyAccelerometer_Mean_Z                     |  25 |  numeric |  -0.9895:0.2807     |  Mean on FFT on Body Accelerometer Z Time means            |
|  Fourier_BodyAccelerometerJerk_Mean_X                 |  26 |  numeric |  -0.9946:0.4743     |  Mean on FFT on Body Accelerometer Jerk X Time means       |
|  Fourier_BodyAccelerometerJerk_Mean_Y                 |  27 |  numeric |  -0.9894:0.2767     |  Mean on FFT on Body Accelerometer Jerk Y Time means       |
|  Fourier_BodyAccelerometerJerk_Mean_Z                 |  28 |  numeric |  -0.992:0.1578      |  Mean on FFT on Body Accelerometer Jerk Z Time means       |
|  Fourier_BodyGyroscope_Mean_X                         |  29 |  numeric |  -0.9931:0.475      |  Mean on FFT on Body Gyroscope X Time means                |
|  Fourier_BodyGyroscope_Mean_Y                         |  30 |  numeric |  -0.994:0.3288      |  Mean on FFT on Body Gyroscope Y Time means                |
|  Fourier_BodyGyroscope_Mean_Z                         |  31 |  numeric |  -0.986:0.4924      |  Mean on FFT on Body Gyroscope Y Time means                |
|  Fourier_BodyAccelerometerMagnitude_Mean              |  32 |  numeric |  -0.9868:0.5866     |  Mean on FFT on Body Accelerometer Magnitude means         |
|  Fourier_BodyBodyAccelerometerJerkMagnitude_Mean      |  33 |  numeric |  -0.994:0.5384      |  Mean on FFT on Body Accelerometer Jerk Magnitude means    |
|  Fourier_BodyBodyGyroscopeMagnitude_Mean              |  34 |  numeric |  -0.9865:0.204      |  Mean on FFT on Body Gyroscope Magnitude means             |
|  Fourier_BodyBodyGyroscopeJerkMagnitude_Mean          |  35 |  numeric |  -0.9976:0.1466     |  Mean on FFT on Body Gyroscope Jerk Magnitude means        |
|  Time_BodyAccelerometer_StDev_X                       |  36 |  numeric |  -0.9961:0.6269     |  Mean on StDevs of Body Accelerometer X Times              |
|  Time_BodyAccelerometer_StDev_Y                       |  37 |  numeric |  -0.9902:0.6169     |  Mean on StDevs of Body Accelerometer Y Times              |
|  Time_BodyAccelerometer_StDev_Z                       |  38 |  numeric |  -0.9877:0.609      |  Mean on StDevs of Body Accelerometer Z Times              |
|  Time_GravityAccelerometer_StDev_X                    |  39 |  numeric |  -0.9968:-0.8296    |  Mean on StDevs of Gravity Accelerometer X Times           |
|  Time_GravityAccelerometer_StDev_Y                    |  40 |  numeric |  -0.9942:-0.6436    |  Mean on StDevs of Gravity Accelerometer Y Times           |
|  Time_GravityAccelerometer_StDev_Z                    |  41 |  numeric |  -0.991:-0.6102     |  Mean on StDevs of Gravity Accelerometer Z Times           |
|  Time_BodyAccelerometerJerk_StDev_X                   |  42 |  numeric |  -0.9946:0.5443     |  Mean on StDevs of Body Accelerometer X Times              |
|  Time_BodyAccelerometerJerk_StDev_Y                   |  43 |  numeric |  -0.9895:0.3553     |  Mean on StDevs of Body Accelerometer Y Times              |
|  Time_BodyAccelerometerJerk_StDev_Z                   |  44 |  numeric |  -0.9933:0.031      |  Mean on StDevs of Body Accelerometer Z Times              |
|  Time_BodyGyroscope_StDev_X                           |  45 |  numeric |  -0.9943:0.2677     |  Mean on StDevs of Body Gyroscope X Times                  |
|  Time_BodyGyroscope_StDev_Y                           |  46 |  numeric |  -0.9942:0.4765     |  Mean on StDevs of Body Gyroscope Y Times                  |
|  Time_BodyGyroscope_StDev_Z                           |  47 |  numeric |  -0.9855:0.5649     |  Mean on StDevs of Body Gyroscope Z Times                  |
|  Time_BodyGyroscopeJerk_StDev_X                       |  48 |  numeric |  -0.9965:0.1791     |  Mean on StDevs of Body Gyroscope Jerk X Times             |
|  Time_BodyGyroscopeJerk_StDev_Y                       |  49 |  numeric |  -0.9971:0.2959     |  Mean on StDevs of Body Gyroscope Jerk Y Times             |
|  Time_BodyGyroscopeJerk_StDev_Z                       |  50 |  numeric |  -0.9954:0.1932     |  Mean on StDevs of Body Gyroscope Jerk Z Times             |
|  Time_BodyAccelerometerMagnitude_StDev                |  51 |  numeric |  -0.9865:0.4284     |  Mean on StDevs of Body Accelerometer Magnitude            |
|  Time_GravityAccelerometerMagnitude_StDev             |  52 |  numeric |  -0.9865:0.4284     |  Mean on StDevs of Gravity Accelerometer Magnitude         |
|  Time_BodyAccelerometerJerkMagnitude_StDev            |  53 |  numeric |  -0.9946:0.4506     |  Mean on StDevs of Body Accelerometer Jerk Magnitude       |
|  Time_BodyGyroscopeMagnitude_StDev                    |  54 |  numeric |  -0.9814:0.3        |  Mean on StDevs of Body Gyroscope Magnitude                |
|  Time_BodyGyroscopeJerkMagnitude_StDev                |  55 |  numeric |  -0.9977:0.2502     |  Mean on StDevs of Body Gyroscope Jerk Magnitude           |
|  Fourier_BodyAccelerometer_StDev_X                    |  56 |  numeric |  -0.9966:0.6585     |  Mean of FFT on StDevs of Body Accelerometer X Times       |
|  Fourier_BodyAccelerometer_StDev_Y                    |  57 |  numeric |  -0.9907:0.5602     |  Mean of FFT on StDevs of Body Accelerometer Y Times       |
|  Fourier_BodyAccelerometer_StDev_Z                    |  58 |  numeric |  -0.9872:0.6871     |  Mean of FFT on StDevs of Body Accelerometer Z Times       |
|  Fourier_BodyAccelerometerJerk_StDev_X                |  59 |  numeric |  -0.9951:0.4768     |  Mean of FFT on StDevs of Body Accelerometer Jerk X Times  |
|  Fourier_BodyAccelerometerJerk_StDev_Y                |  60 |  numeric |  -0.9905:0.3498     |  Mean of FFT on StDevs of Body Accelerometer Jerk Y Times  |
|  Fourier_BodyAccelerometerJerk_StDev_Z                |  61 |  numeric |  -0.9931:-0.0062    |  Mean of FFT on StDevs of Body Accelerometer Jerk Z Times  |
|  Fourier_BodyGyroscope_StDev_X                        |  62 |  numeric |  -0.9947:0.1966     |  Mean of FFT on StDevs Body Gyroscope X Times              |
|  Fourier_BodyGyroscope_StDev_Y                        |  63 |  numeric |  -0.9944:0.6462     |  Mean of FFT on StDevs Body Gyroscope Y Times              |
|  Fourier_BodyGyroscope_StDev_Z                        |  64 |  numeric |  -0.9867:0.5225     |  Mean of FFT on StDevs Body Gyroscope Z Times              |
|  Fourier_BodyAccelerometerMagnitude_StDev             |  65 |  numeric |  -0.9876:0.1787     |  Mean of FFT on StDevs Body Accelerometer Magnitude        |
|  Fourier_BodyBodyAccelerometerJerkMagnitude_StDev     |  66 |  numeric |  -0.9944:0.3163     |  Mean of FFT on StDevs Body Accelerometer Jerk Magnitude   |
|  Fourier_BodyBodyGyroscopeMagnitude_StDev             |  67 |  numeric |  -0.9815:0.2367     |  Mean of FFT on StDevs Body Gyroscope Magnitude            |
|  Fourier_BodyBodyGyroscopeJerkMagnitude_StDev         |  68 |  numeric |  -0.9976:0.2878     |  Mean of FFT on StDevs Body Gyroscope Jerk Magnitude       |
