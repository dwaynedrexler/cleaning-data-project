ReadMe
======

This project was completed in Getting and Cleaning Data course, which is part of the Data Science Specialization track.

The main ending object is **formattedResult**, which is a data frame with the figures formatted.

The instructions to follow were:
You should create one R script called run_analysis.R that does the following. 
  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names. 
  * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I have provided liberal code comments to allow the reviewer to understand what each piece of code is doing.  Here is further explanation of the logical steps the code follows:

The following provides a brief outline of the steps taken to achieve each of the assignment tasks:
**Merges the training and test sets to create one data set.**
  * Combined, using _rbind()_, the training and test data for each of the three data files (subject, X, and y);
  * Combined, using _cbind()_, each of the data sets from step 1 above;
  * Imported the _features.txt_ file from the raw data set to obtain the column names;
  * Named the columns in the resulting data set with those names from _features.txt_. 

**Extracts only the measurements on the mean and standard deviation for each measurement.**
  * Retrieved all of the column names that included the term "mean()" and "std()" using _grep()_, which created a vector with those column numbers;
  * Subsetted the data set with only those columns;
  * Because the resulting data still contained the column with "meanFreq", I re-subsetted the data set again to eliminate columns that included the term "meanFreq" using _-grep("meanFreq", data)_.

**Uses descriptive activity names to name the activities in the data set**
  * Imported the activity labels from the file "activity_labels.txt" in the provided data set;
  * Created an empty character vector to hold the items that would represent the verbal descriptions for the larger data frame;
  * Ran a _for loop_ which iterated through the numeric activity elements and put the verbal activity element in the new character vector;
  * Replaced the column containing the numeric activity representations with the character vector containing the verbal activity representations.

**Appropriately labels the data set with descriptive variable names.**
  * Reviewed the data to detect what types of patterns of abbreviations, etc. were used by the authors of the dataset
  * Created a named character vector where the names were the items to be searched for and the elements were the items to replace them with
  * Used _gsub()_ to search through the list of column names and replace abbreviations with fuller names and create a camelCase-ish look to the column names

**From the data set in Step 4, create a second, independent tidy data set with the average of each variable for each subject and each activity.**
NOTE: I tabulated the averages "by subject, by activity" - so a _nested group-by_ that calculates the average for [Subject1, Activity1], [Subject1, Activity2], [Subject1, Activity3], etc.  I could also interpret the instruction sentence to perform a simple average on just each subject and each activity individually [Subject1], [Subject2], .., [Activity1], [Activity2], etc.  The output for the analysis I performed had 180 rows.  The simple-case _group-by_ would have only contained 36 rows (30 for the subjects and 6 for the activities).
  * Split the data by Subject;
  * Passed the split data into _dplyr_ _group-by(Activity)_ to obtain the measurement averages by Subject, by Activity;
  * Created an empty data frame with all of the column names;
  * Iterated through each object and used _rbind()_ to combine all of the results into a single data frame;
  * Formatted the numbers to 4 decimal places;
  * The resulting table is 180 rows by 68 columns.


Calculating the mean of each measurement by Activity, by Subject
----------------------------------------------------------------
The means of each measurement were calculated by the following steps:
  * Split the data into sets filtered by Subject;
  * Used the plyr library to summarize the means of each of the measurement fields grouped by Activity
