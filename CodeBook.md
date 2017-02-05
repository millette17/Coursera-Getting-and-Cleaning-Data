## Cleaning and Retrieving Data - CodeBook.md

1. Download and unzip data into a working directory of R Studio.
2. Execute the R script.

## Source Data Information

The data for this work was used Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## About R script

The file "run_analysis.R" contains the script to execute:   
1. Merge the training and the test sets to create one data set.   
 Reading files    
  Reading trainings tables   
  Reading testing tables   
  Reading feature vector   
  Reading activity labels   
 Assigning column names   
Merging all data in one set
  
2. Extract the measurements for the mean and standard deviation 
 Reading column names  
 Create vector for defining ID, mean and standard deviation   
 Making nessesary subset from setAllInOne   

3. Use descriptive activity names to name the activities 

4. Label the data set with descriptive variable names   

5. Create tidy data set with the average of each variable for each activity and each subject   
 Making second tidy data set   
 Writing second tidy data set in txt file   

## Variable List
Data from files:
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test`
Merged data:
* `x_data`, `y_data` and `subject_data`
Names apoplied to data sets:
* `features` contains the correct names for the `x_data` dataset
