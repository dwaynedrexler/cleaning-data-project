library(dplyr)

## PREP WORK
# Create a data directory if it doesn't already exist
if (!file.exists("./data")) { dir.create("./data") }

# Download the data file - if it hasn't already been downloaded - and then extract the data from the zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("raw_data.zip")) { download.file(fileUrl, destfile = "raw_data.zip", method = "curl") }
unzip("raw_data.zip", exdir = "./data")

# Read in the training and test data for each variable subject, x, and y into data frames
subjectTrain    <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", sep = "", header = F, strip.white = T, fill = T, colClasses = 'numeric')
subjectTest     <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", sep = "", header = F, strip.white = T, fill = T, colClasses = 'numeric')
xTrain          <- read.table("./data/UCI HAR Dataset/train/X_train.txt", sep = "", header = F, strip.white = T, fill = T, colClasses = rep('numeric', 561))
xTest           <- read.table("./data/UCI HAR Dataset/test/X_test.txt", sep = "", header = F, strip.white = T, fill = T, colClasses = rep('numeric', 561))
yTrain          <- read.table("./data/UCI HAR Dataset/train/y_train.txt", sep = "", header = F, strip.white = T, fill = T, colClasses = 'numeric')
yTest           <- read.table("./data/UCI HAR Dataset/test/y_test.txt", sep = "", header = F, strip.white = T, fill = T, colClasses = 'numeric')

# Read in features.txt.  It has the list of colnames that belong on the x data
xColNames <- read.table("./data/UCI HAR Dataset/features.txt", sep = "", header = F, colClasses = rep('character', 2))[, 2]

# Name the columns on the subject, x, y data frames
names(subjectTrain)     <- "Subject" 
names(subjectTest)      <- "Subject"
names(xTrain)           <- xColNames
names(xTest)            <- xColNames
names(yTrain)           <- "Activity"
names(yTest)            <- "Activity"

## ASSIGNMENT WORK
## ----- STEP 1. "Merges the training and test sets to create one data set." -----
# Merge the training and test data on the subject, x, and y data frames - and then combine them all into a single data frame
subjectData     <- rbind(subjectTrain, subjectTest)
xData           <- rbind(xTrain, xTest)
yData           <- rbind(yTrain, yTest)
data            <- cbind(subjectData, yData, xData)

## ----- STEP 2. "Extracts only the measurements on the mean and standard deviation for each measurement." -----
# Create two vectors which contain only column numbers that contain "mean()" and "std()" - and then filter the data frame for only those columns.  Further filter out columns with meanFreq.
meanCols        <- grep("mean()", names(data))
stdevCols       <- grep("std()", names(data))
data            <- data[, c(1, 2, meanCols, stdevCols)]
data            <- data[, -grep("meanFreq", names(data))]

## ----- STEP 3. "Uses descriptive activity names to name the activities in the data set." -----
activitiesList  <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")
activities      <- vector('character')
# Create a vector that contains the verbal Activity for every observation on the list
for (i in 1:nrow(data)) { activities[i] <- activitiesList[data$Activity[i]] }
# Replace the Activity column in the main data frame with the new, verbally expressive version of the activities
data$Activity  <- activities

## ----- STEP 4. Appropriately labels the x data set with descriptive variable names -----
# Create a named vector where the names are the items you want to search for and the values are the items you want to replace them with
colReplace      <- c("Acc"      = "Accelerometer",
                     "Gyro"     = "Gyroscope",
                     "Mag"      = "Magnitude",
                     "tB"       = "Time-B",
                     "tG"       = "Time-G",
                     "fB"       = "Fourier-B",
                     "mean"     = "Mean",
                     "std"      = "StDev",
                     "-"        = "_",
                     "\\(\\)"   = "")

newNames        <- names(data)
# Use gsub to substitute each item in the names(colReplace) with the value of that name - this creates human readable names for each of the columns
for (i in 1:length(colReplace)) { newNames <- gsub(names(colReplace)[i], colReplace[i], newNames) }
names(data)     <- newNames

## ----- STEP 5. "From the data set in Step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject." -----
# Split the data frame by Subject, and then pass it through dplyr functions: grouping by Activity and summarising each of the columns with the mean function
final <- lapply(split(data, data$Subject), function(d) { d %>% group_by(Activity) %>% summarise_each(funs(mean)) })
# Re-order the first two columns - as Subject becomes the 2nd column after the summarise_each function above
for (i in 1:length(final)) { final[[i]] <- final[[i]][c(2, 1, 3:ncol(final[[i]]))] }
# Initialize an empty data frame to store all of the Subjects' summarised data
result <- data.frame(matrix(ncol = length(names(data)), nrow = 0))
colnames(result) <- names(data)
# Combine the list of data frames with each Subject's summaries into a single data frame containing all Subject's summaries
for (i in 1:length(final)) { result <- rbind(result, final[[i]]) }

# Format the result and then write the text file
formattedResult <- format(result, digits = 4, scientific = F, justify = 'right')
write.table(formattedResult, file = "data.txt", row.names = FALSE, sep = '\t', col.names = TRUE, quote = FALSE)
