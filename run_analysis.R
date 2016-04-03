
library(dplyr)
library(data.table)
library(memisc)

###### load raw datasets #####
alabels <- read.table(file.path("./rawdata/UCI HAR Dataset/activity_labels.txt"), col.names = c("activityId", "activity"))
codebook(alabels)

names_ <- read.table(file.path("./rawdata/UCI HAR Dataset/features.txt"))
names.C <- as.character(names_$V2)
codebook(names.C)


##### Load 'Train' data data #####
getTest <- function(names.C = character()){
  ##### Load 'Test' data #####
  
  test.Subj <- read.table(file.path("./rawdata/UCI HAR Dataset/test/subject_test.txt"), col.names = "subjid")
  test.X <- read.table(file.path("./rawdata/UCI HAR Dataset/test/x_test.txt"), col.names = names.C)
  test.Y <- read.table(file.path("./rawdata/UCI HAR Dataset/test/y_test.txt"), col.names = "activityId")

  test.All <- cbind(test.Subj, test.Y, test.X)
  test.All[,grep("(subjid|Test|activityId|mean|std)", names(test.All), value=TRUE)]
}
test.All <- getTest(names.C)
test.All$class <- "Test"
codebook(test.All)


##### Load 'Test' data data #####
getTrain <- function(names.C){
  ##### Load 'Train' data data #####
  
  train.Subj <- read.table(file.path("./rawdata/UCI HAR Dataset/train/subject_train.txt"), col.names = "subjid")
  train.X <- read.table(file.path("./rawdata/UCI HAR Dataset/train/x_train.txt"), col.names = names.C)
  train.Y <- read.table(file.path("./rawdata/UCI HAR Dataset/train/y_train.txt"), col.names = "activityId")
  
  train.All <- cbind(train.Subj, train.Y, train.X)
  train.All[,grep("(subjid|Train|activityId|mean|std)", names(train.All), value=TRUE)]
}
train.All <- getTrain(names.C)
train.All$class <- "Train"
codebook(train.All)


##### Create a tidy dataset #####
df1 <- rbind(test.All, train.All)
df1 <- df[with(df, order(class, subjid, activityId)), ]
df1 <- merge(df, alabels, by = "activityId")

df1 <- df1[ , c(ncol(df1)-1, 2, 1, ncol(df1), 5:ncol(df1)-2)]  # move 'class', 'subjid', 'activityId', 'activity' columns to the first place
df1 <- df1[with(df1, order(class, subjid, activityId)), ]
codebook(df1)


##### Create a second, independent tidy data set with the average of each variable for each activity and each subject. #####
df2 <- group_by(df1, class, subjid, activityId, activity)
df2 <- summarise_each(df2, funs(mean))


##### Saving the dataset#####
write.table(df2, "TidyDS2_mean.txt", row.name=FALSE) 