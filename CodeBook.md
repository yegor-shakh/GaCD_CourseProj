---
title: "CODE BOOK - Getting and Cleaning Data Course Project"
output: github_document
---

class - there were two subject groups: Test and Train

subjid - The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

  1 - 30

activityId, activity - Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

  Laying - activityid = 6
  Sitting - activityid = 4
  Standing - activityid = 5
  Walking - activityid = 1
  Walking_Downstairs - activityid = 2
  Walking_Upstairs - activityid = 3
  
These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

  tBodyAcc-XYZ
  tGravityAcc-XYZ
  tBodyAccJerk-XYZ
  tBodyGyro-XYZ
  tBodyGyroJerk-XYZ
  tBodyAccMag
  tGravityAccMag
  tBodyAccJerkMag
  tBodyGyroMag
  tBodyGyroJerkMag
  fBodyAcc-XYZ
  fBodyAccJerk-XYZ
  fBodyGyro-XYZ
  fBodyAccMag
  fBodyAccJerkMag
  fBodyGyroMag
  fBodyGyroJerkMag

The set of variables that were estimated from these signals and retained in tidydata are:

mean(): Mean value
std(): Standard deviation