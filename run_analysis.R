filename<- "human_activity_data.zip"

#Checking for data set

if (!file.exists(filename)){
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, filename, method="curl")
}

#Checking for data folder and unzipping files
if (!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

#Create Data Frames

#Features and activities
features<- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions" ))
activities<- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))

#Test
subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test<- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test<- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "code")

#Train
subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train<- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train<- read.table("UCI Har Dataset/train/Y_train.txt", col.names = "code")

#Merge Training and Test Data
X<- rbind(x_train, x_test)
Y<- rbind(y_train, y_test)
subject<- rbind(subject_train, subject_test)
complete_data<- cbind(subject, Y, X)

#Extract Mean and Standard Deviation Measurements
tidydata<- complete_data %>% select(subject, code,contains("mean"), contains("std"))

#Activity Names
tidydata$code <- activities[tidydata$code, 2]


#Label Data Set with Variable Names
names(tidydata)[2]="activity"
names(tidydata)<-gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata)<-gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata)<-gsub("BodyBody", "Body", names(tidydata))
names(tidydata)<-gsub("Mag", "Magnitude", names(tidydata))
names(tidydata)<-gsub("^t", "Time", names(tidydata))
names(tidydata)<-gsub("^f", "Frequency", names(tidydata))
names(tidydata)<-gsub("tBody", "TimeBody", names(tidydata))
names(tidydata)<-gsub("-mean()", "Mean", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-std()", "STD", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-freq()", "Frequency", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("angle", "Angle", names(tidydata))
names(tidydata)<-gsub("gravity", "Gravity", names(tidydata))

#Create Tidy Dataset with Average of Each Variable for Each Activity

tidydata_2<- tidydata %>%
  group_by(subject, activity)  %>% 
  summarise_all(list(mean=mean)) 
write.table(tidydata_2, "tidydataset.txt", row.names = FALSE)




