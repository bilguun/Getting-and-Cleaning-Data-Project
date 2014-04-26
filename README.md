#Getting-and-Cleaning-Data-Project
=================================

##The run_analysis.r script does the following 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

on this (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) data set.

##How to run the script 

1. Download the data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Unzip it. 
3. Put run_analysis into unziped directory
4. Set working directory of your R into unziped directory with setwd("directory path") command.
5. Run source("run_analysis.R") command
6. Two sets will be created after running run_analysis.R 
  * cleaned_data_set.txt  - merged and cleaned data set. 
  * the_averages_of_subject_activities.txt - tidy data set with the average of each variable for each activity and each subject.



