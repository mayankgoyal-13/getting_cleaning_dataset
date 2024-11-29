# Merge the training and test dataset
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading test dataset
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector
features <- read.table("./UCI HAR Dataset/features.txt")

# Reading activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels) <- c("activityID", "activityType")

# Assigning variable names
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"
colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

# Merging all dataset into one set
alltrain <- cbind(y_train, subject_train, x_train)
alltest <- cbind(y_test, subject_test, x_test)
finaldataset <- rbind(alltrain, alltest)

# mean and sd for each measurement
mean_and_std <- grepl("activityID|subjectID|mean\\(\\)|std\\(\\)", colnames(finaldataset))
setforMeanandStd <- finaldataset[, mean_and_std]

# descriptive activity names
setWithActivityNames <- merge(setforMeanandStd, activityLabels, by = "activityID", all.x = TRUE)

# label the data set with descriptive variable name
colnames(setWithActivityNames) <- gsub("^t", "time", colnames(setWithActivityNames))
colnames(setWithActivityNames) <- gsub("^f", "frequency", colnames(setWithActivityNames))
colnames(setWithActivityNames) <- gsub("Acc", "Accelerometer", colnames(setWithActivityNames))
colnames(setWithActivityNames) <- gsub("Gyro", "Gyroscope", colnames(setWithActivityNames))
colnames(setWithActivityNames) <- gsub("Mag", "Magnitude", colnames(setWithActivityNames))
colnames(setWithActivityNames) <- gsub("BodyBody", "Body", colnames(setWithActivityNames))

# independent tidy data set with the average of each variable for each activity and each subject
tidySet <- setWithActivityNames %>%
  group_by(subjectID, activityID, activityType) %>%
  summarise_all(mean)

# Writing second tidy data set into a txt file
write.table(tidySet, "tidySet.txt", row.names = FALSE)
