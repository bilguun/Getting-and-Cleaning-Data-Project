###Data Set 

* Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
* Original *description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

####1. Merging test and training data set part

### Variables

* tmp  - temporary variable to read training data set
* tmp1 - temporary variable to read test data set

* X - merged measurement data set 
** train/X_train.txt with test/X_test.txt -- the result is a 10299 x 561 data frame, as in the original description ("Number of 	Instances: 10299" and "Number of Attributes: 561") 

* Y - merged activity data set 
** train/y_train.txt with test/y_test.txt -- the result is also a 10299 x 1 data frame with activity IDs.

* S - merged subject data set 
train/subject_train.txt with test/subject_test.txt -- the result is a 10299 x 1 data frame with subject IDs,

### Transformation used

* rbind(tmp, tmp2) function used to row bind training and test sets.


####2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.

### Variables

* features - feature data set read from features.txt file
* indices_of_mean_and_standard_deviation - indeces of mean and standart deviation

* with names function labelled each features in X data set. 

### 3. Uses descriptive activity names to name the activities in the data set

#### Variables and functions used
 
* activities - activity data set read from activity_labels.txt file

* with names function labelled each features in Y data set. 

### 4. Appropriately labels the data set with descriptive activity names.

### Variables and functions used

cleaned_data_set  -  merged X, Y, S sets by cbind function


## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#### Variables and functions used

* uniqueSubjects - with unique function extracted each subjects from S subject set
* numActivities - with length function extracted number of activities form activities set

* and used colMeans function to calculate average of each variable for each activity and each subject. 
