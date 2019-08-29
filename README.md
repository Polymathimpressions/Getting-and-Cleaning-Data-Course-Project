
This repo contains my submission for the final project in Coursera's Getting and Cleaning Data Course. The project uses data from the UCI Human Activity Recognition Using Smartphones Data Set.  Accelerometer and gyroscope data was collected from a Samsung Galaxy S II smartphone worn on the waist of 30 volunteers while performing six different activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying).   The included file, "run_analysis.R",  is a script written in R that will download, clean and analyze the data. A text file, called "tidydataset.txt", is a data set that is created as a result of running the script.  It contains the average of each variable for each activity and each subject.  

## Files

* run_analysis.R
  * Checks for the existance of the data set. If not found, downloads and extracts the file "UCI HAR Dataset" to the working directory
  * Merges training and test sets to create one data set (complete_data)
  * Extracts only the measurements on the mean and standard deviation for each measurement
  * Uses descriptive activity names to name activities
  * Labels the data set with descriptive variable names
  * Creates an independant data set with the average of each variable for each activity and each subject. 
  
* codebook.rm
  * Code book file that lists all of the variables, summaries calculated and other information
  
* tidydataset.txt
   * The exported data set file created by the run_analysis.R script.  It contains a tidy data set with the average of each variable for         each activity and each subject, taken from the original merged data set.  
  
  ## Prerequisites
   * Install and load dplyr package
```
install.packages("dplyr")
library(dplyr)
```
   
   ## Run from command line
   * Clone this repo
   * Run the script:
  ```
  $ Rscript run_analysis.R
  ```
   * Look for the final dataset "tidydataset.txt" in the working directory
   ```
   dir
   ``` 
   * Open tidydataset.txt file
   ```
   $ open \tidydataset.txt
   ```

   
 






