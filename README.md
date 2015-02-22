### getdata-CourseProject

The Course Project uses data available from experiments conducted using Samsung Smartphones.  The original data set is available thanks to Reyes-Ortiz et al. (See note at the bottom of the page for detailed reference)

###run_analysis.R

###Description

Create a tidy data set that provides "mean" of selected variables by Subject and Activity from multiple data sets provided in the UCI HAR Dataset. The tidy data set generated chooses only "mean" and "std" data by default; although some flexibility for other selections is made available albeit may require code modifications in the future.

###Usage

run_analysis(datalocation1=character, datalocation2=character, datatype1 ="mean", datatype2="std")

###Arguments
------------------------------------------------------------------------------------------
datalocation1          :    file location for test data, e.g."test"            

datalocation2          :    file location for train data, e.g. "train"          

datatype1              :    first variable type to choose, "mean" measurements is the default

datatype2              :    second variable type to choose, "std" is the default             


###Details


This script outputs a tidy data set of the mean values of 79 variables (that are themselves quanitified as mean and standard deviation of measurements) recorded by Smartphones worn by 30 Subjects during 6 different Activities. 

The script starts with the assumption that the Samsung data is available in the working directory in an unzipped UCI HAR Dataset folder. 

It loads required libraries.  'dplyr' is a required package for this script to run.  If not installed previously, please install 'dplyr'.

First the script reads the data sets given the data locations; It is expected that this code is run with the working directory set to  "UCI HAR Dataset" so no folder names are needed for features.txt and activity_labels.txt which provide the variable names and activity names for the test and train dataset.

Next a dataset that contains all the measurements is created by merging "test" and "train" data. This produces a large data set containing 10299 observations and 563 variables when including "Subject" and "Activity".  The column names are first obtained from "features.txt" but will need to be changed as some of the invalid characters in the names create some errors in using subsequent "select" or "contains" functions.

Making syntactically valid names for variables uses the make.names() function.  In the Codebook the new names that correspond to the original names in the dataset (i.e., old names) are pro
vided for your reference.

In the next section, the R script selects only columns that correspond to "mean" or "std".  There are a few variables that are actually "angle" variables that use a "Mean".  These are ignored as they have been considered not "mean" or "std".  This filtering results in 79 variables.  Including the "Subject" and "Activity" column this results in 81 variables.

To now generate mean values of the variables by "Subject" and "Activity" an additional variable "sub_act" is created that concatenates "Subject" and "Activity" using the paste() function.  Apply summarise to all variables requires the use of summarise_each().

Finally, the data is ordered by the Subject number and written into a text file titled "summarydata.txt".












==================================================================
Human Activity Recognition Using Smartphones Data set
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

