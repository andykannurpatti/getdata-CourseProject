run_analysis <- function (datalocation1=character, datalocation2=character, datatype1 ="mean", datatype2="std") {

##Load require libraries
        require(dplyr)
        


##Read the data sets given the data locations; datalocation1 is the folder name with the "test" data and datalocation2 is the folder name for "train" data. It is expected that this code is run with the working directory set to  "UCI HAR Dataset" so no folder names are needed for features.txt and activity_labels.txt
        X_test <- read.table(paste(datalocation1,"/X_test.txt",sep=""))
        X_train <- read.table(paste(datalocation2,"/X_train.txt",sep=""))
        y_test <- read.table(paste(datalocation1,"/y_test.txt",sep=""))
        y_train <- read.table(paste(datalocation2,"/y_train.txt",sep=""))
        subject_test <- read.table(paste(datalocation1,"/subject_test.txt",sep=""))
        subject_train <- read.table(paste(datalocation2,"/subject_train.txt",sep=""))
        features <- read.table("features.txt")
        activity_labels <- read.table("activity_labels.txt")
##Merge the data to make one data set and name columns
        X_all <- rbind(X_test,X_train)
        y_all <- rbind(y_test, y_train)
        subject_all <- rbind(subject_test, subject_train)
        all_data <- cbind(subject_all, y_all, X_all)
        names(all_data) <- c("Subject", "Activity", as.character(features[,2]))
        old_names <- names(all_data)

##Filter all_data to retain mean and std information only to create required tidy dataset

##This sub-section makes valid names of variables valid for subsequent use of select function; a list of new names and corresponding old names is included in "column_names.txt" included in the Codebook

        valid_column_names <- make.names(names=old_names, unique=TRUE, allow_ = TRUE)  
        names(all_data) <- valid_column_names

##This sub-section chooses the variables needed. With the new column names if there was a "." preceding the datatype requested, e.g., "mean" then the data is included.  The method used to change the variable names ignores the "angle" measurements that use the "Mean". Further information is available in the documentation.

        req_data <- select(all_data, matches("Subject"), matches("Activity"),contains(paste(".",datatype1,sep="")), contains(paste(".",datatype2,sep="")))
        req_data$Activity <- factor(req_data$Activity, levels = activity_labels$V1, labels = activity_labels$V2)
        req_data<- req_data[order(req_data$Subject),]

        

##summarize data to create tidy data containing mean values by Subject and Activity; A tidy data set "summarydata.txt" is written in the folder "UCI HAR Dataset"
        req_data$sub_act <-paste(req_data$Subject,req_data$Activity)
       # dt <- select(req_data, -matches("Subject"),-matches("Activity"))
        gdt <- group_by(req_data, sub_act)
        x <- summarise_each(gdt,funs(mean))
        x <- select(x, -matches("sub_act"))
        x$Activity <- factor(x$Activity, levels = activity_labels$V1, labels = activity_labels$V2)
        x<- x[order(x$Subject),]

        write.table(x, "summarydata.txt", row.names=FALSE)

}
