Getting and Cleaning Data - Project Code Book
=============================================
Author: Dwayne Drexler
----------------------
Project Submitted: February 22, 2015
------------------------------------





The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

|  Variable Name                                                | Column# |  Variable Type   |  Value Range      |
----------------------------------------------------------------|---------|------------------|-------------------|
|  Subject                                                      |  1      |  numeric         |  1:30             |
|  Activity                                                     |  2      |  string          |  AMEND ME!        |
|  Time_BodyAccelerometer_Mean_X                                |  3      |  numeric         |  0.2216:0.3015    |
|  Time_BodyAccelerometer_Mean_Y                                |  4      |  numeric         |  -0.0405:-0.0013  |
|  Time_BodyAccelerometer_Mean_Z                                |  5      |  numeric         |  -0.1525:-0.0754  |
|  Time_GravityAccelerometer_Mean_X                             |  6      |  numeric         |  -0.68:0.9745     |
|  Time_GravityAccelerometer_Mean_Y                             |  7      |  numeric         |  -0.4799:0.9566   |
|  Time_GravityAccelerometer_Mean_Z                             |  8      |  numeric         |  -0.4951:0.9579   |
|  Time_BodyAccelerometerJerk_Mean_X                            |  9      |  numeric         |  0.0427:0.1302    |
|  Time_BodyAccelerometerJerk_Mean_Y                            |  10     |  numeric         |  -0.0387:0.0568   |
|  Time_BodyAccelerometerJerk_Mean_Z                            |  11     |  numeric         |  -0.0675:0.0381   |
|  Time_BodyGyroscope_Mean_X                                    |  12     |  numeric         |  -0.2058:0.1927   |
|  Time_BodyGyroscope_Mean_Y                                    |  13     |  numeric         |  -0.2042:0.0275   |
|  Time_BodyGyroscope_Mean_Z                                    |  14     |  numeric         |  -0.0725:0.1791   |
|  Time_BodyGyroscopeJerk_Mean_X                                |  15     |  numeric         |  -0.1572:-0.0221  |
|  Time_BodyGyroscopeJerk_Mean_Y                                |  16     |  numeric         |  -0.0768:-0.0132  |
|  Time_BodyGyroscopeJerk_Mean_Z                                |  17     |  numeric         |  -0.0925:-0.0069  |
|  Time_BodyAccelerometerMagnitude_Mean                         |  18     |  numeric         |  -0.9865:0.6446   |
|  Time_GravityAccelerometerMagnitude_Mean                      |  19     |  numeric         |  -0.9865:0.6446   |
|  Time_BodyAccelerometerJerkMagnitude_Mean                     |  20     |  numeric         |  -0.9928:0.4345   |
|  Time_BodyGyroscopeMagnitude_Mean                             |  21     |  numeric         |  -0.9807:0.418    |
|  Time_BodyGyroscopeJerkMagnitude_Mean                         |  22     |  numeric         |  -0.9973:0.0876   |
|  Fourier_BodyAccelerometer_Mean_X                             |  23     |  numeric         |  -0.9952:0.537    |
|  Fourier_BodyAccelerometer_Mean_Y                             |  24     |  numeric         |  -0.989:0.5242    |
|  Fourier_BodyAccelerometer_Mean_Z                             |  25     |  numeric         |  -0.9895:0.2807   |
|  Fourier_BodyAccelerometer_MeanFreq_X                         |  26     |  numeric         |  -0.6359:0.1591   |
|  Fourier_BodyAccelerometer_MeanFreq_Y                         |  27     |  numeric         |  -0.3795:0.4665   |
|  Fourier_BodyAccelerometer_MeanFreq_Z                         |  28     |  numeric         |  -0.5201:0.4025   |
|  Fourier_BodyAccelerometerJerk_Mean_X                         |  29     |  numeric         |  -0.9946:0.4743   |
|  Fourier_BodyAccelerometerJerk_Mean_Y                         |  30     |  numeric         |  -0.9894:0.2767   |
|  Fourier_BodyAccelerometerJerk_Mean_Z                         |  31     |  numeric         |  -0.992:0.1578    |
|  Fourier_BodyAccelerometerJerk_MeanFreq_X                     |  32     |  numeric         |  -0.576:0.3314    |
|  Fourier_BodyAccelerometerJerk_MeanFreq_Y                     |  33     |  numeric         |  -0.602:0.1957    |
|  Fourier_BodyAccelerometerJerk_MeanFreq_Z                     |  34     |  numeric         |  -0.6276:0.2301   |
|  Fourier_BodyGyroscope_Mean_X                                 |  35     |  numeric         |  -0.9931:0.475    |
|  Fourier_BodyGyroscope_Mean_Y                                 |  36     |  numeric         |  -0.994:0.3288    |
|  Fourier_BodyGyroscope_Mean_Z                                 |  37     |  numeric         |  -0.986:0.4924    |
|  Fourier_BodyGyroscope_MeanFreq_X                             |  38     |  numeric         |  -0.3958:0.2492   |
|  Fourier_BodyGyroscope_MeanFreq_Y                             |  39     |  numeric         |  -0.6668:0.2731   |
|  Fourier_BodyGyroscope_MeanFreq_Z                             |  40     |  numeric         |  -0.5075:0.3771   |
|  Fourier_BodyAccelerometerMagnitude_Mean                      |  41     |  numeric         |  -0.9868:0.5866   |
|  Fourier_BodyAccelerometerMagnitude_MeanFreq                  |  42     |  numeric         |  -0.3123:0.4358   |
|  Fourier_BodyBodyAccelerometerJerkMagnitude_Mean              |  43     |  numeric         |  -0.994:0.5384    |
|  Fourier_BodyBodyAccelerometerJerkMagnitude_MeanFreq          |  44     |  numeric         |  -0.1252:0.4881   |
|  Fourier_BodyBodyGyroscopeMagnitude_Mean                      |  45     |  numeric         |  -0.9865:0.204    |
|  Fourier_BodyBodyGyroscopeMagnitude_MeanFreq                  |  46     |  numeric         |  -0.4566:0.4095   |
|  Fourier_BodyBodyGyroscopeJerkMagnitude_Mean                  |  47     |  numeric         |  -0.9976:0.1466   |
|  Fourier_BodyBodyGyroscopeJerkMagnitude_MeanFreq              |  48     |  numeric         |  -0.1829:0.4263   |
|  Time_BodyAccelerometer_StDev_X                               |  49     |  numeric         |  -0.9961:0.6269   |
|  Time_BodyAccelerometer_StDev_Y                               |  50     |  numeric         |  -0.9902:0.6169   |
|  Time_BodyAccelerometer_StDev_Z                               |  51     |  numeric         |  -0.9877:0.609    |
|  Time_GravityAccelerometer_StDev_X                            |  52     |  numeric         |  -0.9968:-0.8296  |
|  Time_GravityAccelerometer_StDev_Y                            |  53     |  numeric         |  -0.9942:-0.6436  |
|  Time_GravityAccelerometer_StDev_Z                            |  54     |  numeric         |  -0.991:-0.6102   |
|  Time_BodyAccelerometerJerk_StDev_X                           |  55     |  numeric         |  -0.9946:0.5443   |
|  Time_BodyAccelerometerJerk_StDev_Y                           |  56     |  numeric         |  -0.9895:0.3553   |
|  Time_BodyAccelerometerJerk_StDev_Z                           |  57     |  numeric         |  -0.9933:0.031    |
|  Time_BodyGyroscope_StDev_X                                   |  58     |  numeric         |  -0.9943:0.2677   |
|  Time_BodyGyroscope_StDev_Y                                   |  59     |  numeric         |  -0.9942:0.4765   |
|  Time_BodyGyroscope_StDev_Z                                   |  60     |  numeric         |  -0.9855:0.5649   |
|  Time_BodyGyroscopeJerk_StDev_X                               |  61     |  numeric         |  -0.9965:0.1791   |
|  Time_BodyGyroscopeJerk_StDev_Y                               |  62     |  numeric         |  -0.9971:0.2959   |
|  Time_BodyGyroscopeJerk_StDev_Z                               |  63     |  numeric         |  -0.9954:0.1932   |
|  Time_BodyAccelerometerMagnitude_StDev                        |  64     |  numeric         |  -0.9865:0.4284   |
|  Time_GravityAccelerometerMagnitude_StDev                     |  65     |  numeric         |  -0.9865:0.4284   |
|  Time_BodyAccelerometerJerkMagnitude_StDev                    |  66     |  numeric         |  -0.9946:0.4506   |
|  Time_BodyGyroscopeMagnitude_StDev                            |  67     |  numeric         |  -0.9814:0.3      |
|  Time_BodyGyroscopeJerkMagnitude_StDev                        |  68     |  numeric         |  -0.9977:0.2502   |
|  Fourier_BodyAccelerometer_StDev_X                            |  69     |  numeric         |  -0.9966:0.6585   |
|  Fourier_BodyAccelerometer_StDev_Y                            |  70     |  numeric         |  -0.9907:0.5602   |
|  Fourier_BodyAccelerometer_StDev_Z                            |  71     |  numeric         |  -0.9872:0.6871   |
|  Fourier_BodyAccelerometerJerk_StDev_X                        |  72     |  numeric         |  -0.9951:0.4768   |
|  Fourier_BodyAccelerometerJerk_StDev_Y                        |  73     |  numeric         |  -0.9905:0.3498   |
|  Fourier_BodyAccelerometerJerk_StDev_Z                        |  74     |  numeric         |  -0.9931:-0.0062  |
|  Fourier_BodyGyroscope_StDev_X                                |  75     |  numeric         |  -0.9947:0.1966   |
|  Fourier_BodyGyroscope_StDev_Y                                |  76     |  numeric         |  -0.9944:0.6462   |
|  Fourier_BodyGyroscope_StDev_Z                                |  77     |  numeric         |  -0.9867:0.5225   |
|  Fourier_BodyAccelerometerMagnitude_StDev                     |  78     |  numeric         |  -0.9876:0.1787   |
|  Fourier_BodyBodyAccelerometerJerkMagnitude_StDev             |  79     |  numeric         |  -0.9944:0.3163   |
|  Fourier_BodyBodyGyroscopeMagnitude_StDev                     |  80     |  numeric         |  -0.9815:0.2367   |
|  Fourier_BodyBodyGyroscopeJerkMagnitude_StDev                 |  81     |  numeric         |  -0.9976:0.2878   |

