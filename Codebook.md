####Codebook for Course Project


The variables selected for the database come from calculating means of features reported in the UCI HAR Dataset.  For a description of which signals and how they were processed prior to being reported in the UCI HAR Dataset please refer to "features_info.txt" included with the files.

The variables in the summarydata.txt correspond to the mean of the variables reported in the UCI HAR Dataset in "X_test.txt" and "X_train.txt" as the run_analysis.R script combines and selects certain variables reported in these datasets. Specifically, the means were calculated for each "Subject" when they performed a specific "Activity".

For example:

tBodyGyroJerk.std...X  is the mean of tBodyGyroJerk-std()-X values calculated for each Subject when they performed a certain Activity.

There are 79 such means of variables summarized in "summary.txt" and a look up table is provided in a text file found in this repo and is titled "column_names.txt".

Subject  corresponds to the id of the subject and ranges from 1 to 30.

Activity is described as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING and denote the activity being performed by the Subject when the data was gathered.

