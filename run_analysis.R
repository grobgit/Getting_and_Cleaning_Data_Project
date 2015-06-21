##
## Getting and Cleaning Data Course Project
## Author: Graham Robertson
## Date: 19th June 2016
##

# Load the required libraries
library(dplyr)

##
## Note: following steps assume that the source data files have been downloaded, unzipped and
##       saved in your in working directory.
## 

##
## STEP 1  --  Merge the training and the test sets to create one data set.   
##

# read in training data, all data in .txt format so;
x_train <- read.table("X_Train.txt")             # read in training data set
y_train <- read.table("y_train.txt")             # read in training data activities
subject_train <- read.table("subject_train.txt") # read in training subject data

# read in test data, all data in .txt format so;
x_test <- read.table("X_Test.txt")               # read in test data set
y_test <- read.table("y_test.txt")               # read in training data activities  
subject_test <- read.table("subject_test.txt")   # read in training subject data


# combine data sets incrementally using rbind and cbind
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
y_x_data <- cbind(y_data, x_data)
all_data <- cbind(subject_data, y_x_data)

# all data set now in one df, all_data

##
## Step 4 - Appropriately label the data set with descriptive variable names
##
# Note: step completed out of order as the measurment descriptive variable names required in step 2

features <- read.table("features.txt")                 # read feature (variable) names
varnames <- tolower(as.character(features[,2]))        # create character vector of these names in lower case(to aid readability)
varnames <- c("subject_id", "activity", varnames)      # add names for first two columns

names(all_data) <- varnames                            # re-name all_data columns with those in varnames                 

##
## STEP 2  --  Extract only the measurements on the mean and standard deviation for each measurement.
##

mean_std_only <- grep("mean\\(|std", varnames)          # search through for mean or std pattern in varnames
mean_std_data <- all_data[,c(1,2,mean_std_only)]        # subset all_data for matches keeping subject_id & Activity columns

##
## STEP 3  --  Use descriptive activity names to name the activities in the data set
##

# read in the six activity labels
activity_labels <- read.table("activity_labels.txt")

# update activity variable values in mean_std_data df by exchanging integer with corresponding activity works in activity_labels
mean_std_data[, 2] <- activity_labels[mean_std_data[, 2], 2]

# change class of subject_id to factor for ease of future conditioning
mean_std_data$subject_id <- as.factor(mean_std_data$subject_id)


## Note: duplicates text in variabe names e.g. fbodybodygyromag.mean are down to errors in original source input data.
## Decided to leave as is so no confusion if a trace back to the origianl data is required at a later date

                                                                  

##
## STEP 4  --  Appropriately label the data set with descriptive variable names.
##
## Note: majority of this step was completed between steps 1 & 2

# Decided to run make.names so variable names are syntactically valid
names(mean_std_data) <- make.names(names(mean_std_data))
# And remove occurences of ".." to make names more readable
names(mean_std_data) <- gsub("\\.\\.", "", names(mean_std_data))

## We now have a tidy data set in wide format held in the mean_std_data df
## Note: wide data seem as appropriate for this problem


##
## STEP 5  --  From the data set in step 4, creates a second, independent tidy data set with the average of each
##            variable for each activity and each subject.

# This step will use the dplyr package installed at start of script

# create new table from mean_std_data df
mean_std_table <- tbl_df(mean_std_data)
# group by subject_id and activity categorical variables
group_temp1 <- group_by(mean_std_table, subject_id, activity)


# aggregate the grouped data, mean of measurment variable columns
group_temp2 <- aggregate(group_temp1[,3:68], by= list(group_temp1$subject_id, group_temp1$activity), FUN = mean)
# rename Group.1 and Group.2 columns names with subject_id and activity
names(group_temp2)[names(group_temp2) == "Group.1"] <- "subject_id"
names(group_temp2)[names(group_temp2) == "Group.2"] <- "activity"      

# save as a table
tidy_table <- tbl_df(group_temp2)

# view our tidy_table
View(tidy_table)

# write to working directory
write.table(tidy_table, "tidy_table.txt", row.name=FALSE)



