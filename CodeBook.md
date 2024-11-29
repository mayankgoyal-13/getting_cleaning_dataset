# Code Book

This document provides an overview of the source data, script functionality, and variables used in the project.

---

## Source Data

- **Dataset**: [Human Activity Recognition Using Smartphones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
- **Download Link**: [UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
- **Description**: Data collected from the accelerometers of the Samsung Galaxy S smartphone, containing activity and measurement records.

---

## Running the Analysis

1. **Prepare the Data**:
   - Download and unzip the dataset into your working directory.
   - Ensure the data files retain their original structure and names.

2. **Execute the Script**:
   - Run the `run_analysis.R` script in R/RStudio to clean and process the data.

---

## Script Overview (`run_analysis.R`)

The script performs the following operations:

1. **Data Reading and Merging**:
   - Reads and merges training and test datasets with feature vectors and activity labels.

2. **Extracting Relevant Measurements**:
   - Filters measurements of mean and standard deviation.

3. **Descriptive Naming**:
   - Replaces activity IDs with descriptive activity names.
   - Assigns descriptive labels to variables.

4. **Creating Tidy Data**:
   - Computes the average of each variable for each activity and subject.
   - Outputs the final tidy dataset to `tidySet.txt`.

---

## Variables

- **Original Datasets**:  
  - `x_train`, `y_train`, `x_test`, `y_test`, `subject_train`, `subject_test`  
- **Merged Datasets**:  
  - `x_data`, `y_data`, `subject_data`  
- **Features**:  
  - Contains variable names applied to `x_data`.
