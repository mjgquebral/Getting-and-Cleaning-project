library(reshape2)

file <- "UCI HAR Dataset"
zip <- "getdata_dataset.zip"

##file download and extract
if (!file.exists(file)){
	URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(URL, zip, method="curl")
	unzip(zip)
}

#loading proper names and pinpointing which indices have mean or std
actLabel <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
target <- grep(".*[Mm]ean|.*std",features[,2])
columns<- c("Subject","Activity",as.character(features[,2]))


##Merging train datasets
trainSubj<- read.table("UCI HAR Dataset/train/subject_train.txt")
trainAct <- read.table("UCI HAR Dataset/train/Y_train.txt")
train <-read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(trainSubj, trainAct, train)

##Merging test datasets
testSubj <-read.table("UCI HAR Dataset/test/subject_test.txt")
testAct <- read.table("UCI HAR Dataset/test/Y_test.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind (testSubj,testAct,test)

##Merge train and test
final<-rbind(train,test)
colnames(final)<-columns

##extract variables related to mean and std
extract <- cbind(final[,1:2],final[,target+2])
 
##Format Activity names
extract$Activity <- factor(extract$Activity, levels=actLabel[,1], labels = actLabel[,2])
extract$Subject <- as.factor(extract$Subject)

##create tidy data with mean for each variable per subject and activity
tidy<- melt(extract, id = c("Subject", "Activity"))
tidy<- dcast(tidy, Subject + Activity ~ variable, mean)
write.table(tidy, "tidy.txt", row.names = FALSE, quote = FALSE)


