#This is the README file for the Getting and Cleaning Data Course Project


##The the Githib repo includes:
1. This README.md file
2. The run_analysis.R file
3. The codebook.md file
4. The tidy_table.txt file

 
This "README" file describes how the run_analysis code generates the tidy_data file. It details the steps required and the functions used to process the data. The rational for the choices made to produce the tidy_table are also covered.

The "codebook" file contains a description of the variables in the "tidy_table".

The "tidy_table" is the same file uploaded onto the course assignment page.



##run_analysis

The input data files to be read should be in your working directory.
In addition to the base R packages the dplyr package will be required and is therefore loaded in by the script.

##Step 1
The "X-Train.txt", "y-Train.txt", "subject_train.txt","X_Test.txt","y_test.txt" and "subject_test.txt" files are read in using the read.table() function.

Note: important of the folling commands is important so all corresponding data is in the correct order:
Using the rbind() command:
The training and test measurements are combined in one table then;
The training and test activity labels are combined in one table then;
The training and test subject IDs are are combined in one table.
Using the cbind() command:
The activity labels and measurement tables are combined then;
This is then combined wit the subject IDs table.
We know have a data frame ("all_data") of 10299 objects and 563 variables 

##Step 2 (including step 4)
To allow for the extraction of specific measurements, step 4 (label data set with descriptive variable names) is carried out first.

The "features.txt" is read in and stored in a data frame
The variable names are extracted to a character vector and all text changed to lower text to aid later tidy data readability.
variable names are added to the start of this vector corresponding to the subject id and activity variables in the data frame created at step 1.
Using the names() function, the "all_data" data frame columns are re-named with descriptive names.

Only the measurements on the mean and standard deviation for each measurement are required. Inspecting the input data I concluded that this did not include any meanFreq() measurements. This determined the format of the first argument of the grep command used to search for mean and std patterns in the variable descriptive names. The result of this search was subsetted the "all_data" data_frame while retaining the subject_id and activity columns to produce the reduced "mean_std_data" data frame, 10299 objects and 68 variables.

   
##Step 3
To use the descriptive activity names we first read in the "activity_lables.txt" file using the read.table() function. The activity variable values in mean_std_data (integers) are then exchanged with their corresponding activity name. The activity variable is now a Factor type.
For ease of future conditioning the subject_id variable is converted from integer type to Factor. 
**Note:** duplicates text in variable names e.g. fbodybodygyromag.mean are down to errors in original source input data. Decided to leave as is so no confusion introduced if a trace back to the original data is required at a later date.

##Step 4
The descriptive actitity names were added at step 2; however to improve data tidiness:
The make.names() function was used to ensure variable names are syntactically valid
gsub() was used to remove occurences of ".." in variable names to make them more readable

We now have a tidy data set in wide format held with the data frame "mean_std_data".
**Note:** wide data seem as appropriate for this problem

##Step 5
To create an independent tidy data set with the average of each variable for each activity and each subject a data table is first created from our tidy data frame.
Using the dplyr group_by function this table is grouped by the subject_id and activity variable.
Using the aggregate function for each set of subject_id/activity combination measurements, the mean is calculated.
The subject_id and activity columns names are re-inserted (lost during grouping).
As the aggregate() function converted data back into a data frame, the data is saved in a new data table "tidy_table".

 
##tidy_data
This data table contains 180 observations (30 subject_id x 6 activity combinations) of 68 variables (relating to the mean and std measurements).
By use of the View() function the script displays the table in RStudio.
The script also writes this table to file, "tidy_data.txt", by the use of the write.table() function. 


##Running the Script
To run the run_analysis script save the "run_analysis.R" file in your working directory then;
use the source() command i.e. source("run_analysis.R").

##Viewing the tidy_table from file
Save the "tidy_table.txt" file in your local directory then;
Use the read.table() function with the header agrument set to TRUE;
The use the View() function.
e.g.
data <- read.table("tidy_table.txt", header = TRUE)
View(data)


##Viewing the tidy_table from the course assingment page
If you right click on a file name in the submission box and copy the web address, you can paste it into a script e.g.
address <- "paste link in here"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
View(data)

or with library psych installed and loaded the link can be inserted from the clipboard e.g.
library(psych)
address <- read.clipboard.tab(header = FALSE, stringsAsFactors = FALSE)[1,1]
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
View(data)

**Above viewing advise courtesy of Dave Hood's Tidy data and the Assignment thread**https://class.coursera.org/getdata-015/forum/thread?thread_id=27