# Peer-Graded Assignment: Getting and Cleaning Data Course Project (2024)

This repository contains the R script `run_analysis.R` that demonstrates data cleaning and analysis techniques using accelerometer data from the Samsung Galaxy S smartphone. The goal of this project is to show proficiency in collecting, working with, and cleaning data to prepare it for further analysis.

---

## Repository Contents

### 1. **`run_analysis.R`**
This R script performs the following steps as required by the project:
1. Merges the training and test datasets to create a unified data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Assigns descriptive activity names to the activities in the data set.
4. Labels the data set with clear and descriptive variable names.
5. Creates a second, independent tidy data set containing the average of each variable for each activity and each subject.

### 2. **`CodeBook.md`**
This file provides a detailed description of:
- The variables in the data set.
- The source of the data.
- Transformations and cleaning steps applied to prepare the tidy data set.

### 3. **`tidySet.txt`**
The final output of the analysis: a tidy data set containing the average of each variable for every activity and subject. This file is generated by the `run_analysis.R` script.

---

## How to Run the Script

Follow these steps to replicate the analysis:

1. **Download the Data**
   - Download the dataset from the provided [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
   - Extract the contents of the downloaded `.zip` file into your working directory.

2. **Run the R Script**
   - Open R or RStudio.
   - Set your working directory to the location of the extracted files.
   - Run the `run_analysis.R` script.

   The script will:
   - Read the data.
   - Perform data cleaning and transformations.
   - Output the tidy data set as `tidySet.txt` in your working directory.

---

## About the Data

The data for this project was collected from the accelerometers of the Samsung Galaxy S smartphone. It contains measurements of various physical activities performed by participants, such as walking, sitting, and standing.

---
