# Code Book

The run_analysis.R script downloads, extracts, cleans and exports a sample tidy data set file using the project's required parameters 
for guidance.  

* Download the data
  * After checking if the file exists, the dataset is downloaded and extracted to a folder called "UCI HAR Dataset" in the working 
     directory 

* Assign data to the variables
    * features<- features.txt   *List of all features*
    * activities<- activity_labels.txt    *Links the class labels with their activity name*
    * subject_test<- subject_test.txt   *Test data of 9 out of 30 subjects*
    * x_test<- X_test.txt   *Recorded features test data*
    * y_test<- Y_test.txt   *Test labels*
    * subject_train<- subject_train.txt     *Train data of 21 out of 30 subjects*
    * x_train<- X_train.txt   *Recorded features train data*
    * y_train<- Y_train.txt   *Training labels*

* Merge Training and Test Data Sets
    * X created by merging x_train and x_test using rbind() function
    * Y created by merging y_train and y_test using rbind() function
    * subject created by merging subject_train and subject_test using rbind() function
    * complete_data created by merging subject, X and Y using cbind() function
    
* Extract only the measurements on the mean and standard deviation for each measurement
    * tidydata is created by subsetting complete_data, selecting only the columns: subject, code and the measurements with mean and 
      standard deviation for each measurement
      
* Change to descriptive activity names
    * Numbers in code column of tidydata replaced with activity name taken from second column of activities variable
    
* Label Data Set with descriptive variable names
    * code column renamed to activities
    * Acc in column's name replaced by Accelerometer
    * Gyro in column's name replaced by Gyroscope
    * BodyBody in column's name replaced by Body
    * Mag in column's name replaced by Magnitude
    * All start with character f in column's name replaced by Frequency
    * All start with character t in column's name replaced by Time
    
* Tidy Data Set created with the average of each variable for each activity and each subject
    * tidydata_2 is created by summarizing tidydata taking the means of each variable for each activity and each subject, 
      grouped by subject and activity
    * Export tidydata_2 by using write.table() with row.name = FALSE into a file named tidydataset.txt file
    

    
