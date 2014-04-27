# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# This R script does the following:
# 1. Merges the training and the test sets to create one data set.

tmp <- read.table("train/X_train.txt")
tmp2 <- read.table("test/X_test.txt")
X <- rbind(tmp, tmp2)

tmp <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
S <- rbind(tmp, tmp2)

tmp <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
Y <- rbind(tmp, tmp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")
indices_of_mean_and_standard_deviation <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_mean_and_standard_deviation]
names(X) <- features[indices_of_mean_and_standard_deviation, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
#names(X) <- tolower(names(X))  

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
#activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
activities[, 2] = gsub("_", "", as.character(activities[, 2]))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names. 

names(S) <- "subject"
cleaned_data_set <- cbind(S, Y, X)
write.table(cleaned_data_set, "cleaned_data_set.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned_data_set)[2]
averages_set = cleaned_data_set[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    averages_set[row, 1] = uniqueSubjects[s]
    averages_set[row, 2] = activities[a, 2]
    tmp <- cleaned_data_set[cleaned_data_set$subject==s & cleaned_data_set$activity==activities[a, 2], ]
    averages_set[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(averages_set, "the_averages_of_subject_activities.txt")
