# load activity_labels and features
activityLabels <- fread(
  file.path(path, "UCI HAR Dataset/activity_labels.txt"),
  col.names = c("classLabels", "activityNames")
)

features <-fread(
  file.path(path, "/UCI HAR Dataset/features.txt"),
  col.names = c("index", "featureNames")
)

# extracting mean and std from features
featuresNeeded <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[featuresNeeded, featureNames]
measurements <- gsubfn(
  "(^t|^f|Acc|Gyro|Mag|BodyBody|\\(\\))",
  list(
    "t" = "Time",
    "f" = "Frequency",
    "Acc" = "Accelerometer",
    "Gyro" = "Gyroscope",
    "Mag" = "Magnitude",
    "BodyBody" = "Body",
    "()" = ""
  ),
  measurements
)
# load train data
train <- fread(file.path(path, "/UCI HAR Dataset/train/X_train.txt"))[, featuresNeeded, with = FALSE]
setnames(train, colnames(train), measurements)

activityTrain <-
  fread(file.path(path, "/UCI HAR Dataset/train/y_train.txt"),
        col.names = "Activity")
subjectTrain <-
  fread(file.path(path, "/UCI HAR Dataset/train/subject_train.txt"),
        col.names = "SubjectNo.")

train <- cbind(activityTrain, subjectTrain, train) # bind all columns together

# load test data
test <- fread(file.path(path, "/UCI HAR Dataset/test/X_test.txt"))[, featuresNeeded, with = FALSE]
setnames(test, colnames(test), measurements)

activityTest <-
  fread(file.path(path, "/UCI HAR Dataset/test/y_test.txt"),
        col.names = "Activity")
subjectTest <-
  fread(file.path(path, "/UCI HAR Dataset/test/subject_test.txt"),
        col.names = "SubjectNo.")

test <- cbind(activityTest, subjectTest, test) 

# merge test and train by rows
testTrain <- rbind(train, test)

# factor Activity column based on activity labels
testTrain[["Activity"]] <- factor(testTrain[, Activity]
                                  , levels = activityLabels[["classLabels"]]
                                  , labels = activityLabels[["activityNames"]]
)
# as.factor() to create turn subject numbers into factors
testTrain[["SubjectNo."]] <- as.factor(testTrain[, SubjectNo.])

# melt then cast the data table
testTrain <- melt.data.table(testTrain, id=c("SubjectNo.", "Activity"))
testTrain <- dcast(testTrain, SubjectNo. + Activity ~ variable, mean)

# write final tidy data into new file
fwrite(testTrain, file="tidySet.txt")
