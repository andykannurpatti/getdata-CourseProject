### getdata-CourseProject

The Course Project uses data available from experiments conducted using Samsung Smartphones.  The original dataset is available thanks to Reyes-Ortiz et al. (See note at the bottom of the page for detailed reference)

###run_analysis.R

###Description

Create a tidy data set that provides "mean" of selected variables by Subject and Activity from multiple datasets provided in the UCI HAR Dataset. The tidy data set generated chooses only "mean" and "std" data by default; although some flexibility for other selections is made available albeit may require code modifications in the future.

###Usage

run_analysis(datalocation1=character, datalocation2=character, datatype1 ="mean", datatype2="std")

###Arguments

datalocation1           file location for test data, e.g."test"
datalocation2           file location for train data, e.g. "train"
datatype1               first variable type to choose, "mean" measurements is the default
datatype2               second variable type to choose, "std" is the default

###Details


This script starts with the assumption that the Samsung data is available in the working directory in an unzipped UCI HAR Dataset folder. 

It loads required libraries.  'dplyr' is a required package for this script to run.  If not installed previously, please install 'dplyr'.

run_analysis <- function (datalocation1=character, datalocation2=character, datatype1 ="mean", datatype2="std")

datalocation1   "test" 







==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

