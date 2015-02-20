runAnalysis <- function(zipfileURL) {
        setwd("../")
        setwd("./Desktop")
        download.file(zipfileURL, paste(getwd(), "/zip.zip", sep = ""))
 
        unzip("./zip.zip", unzip = "internal", exdir = getwd())

#Get the Label Data:
setwd("./UCI HAR Dataset")
features <- read.table("features.txt", fill = TRUE)
activities <- read.table("activity_labels.txt")

#Get all the Training Files:
setwd("./train")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

#Give X_train meaningful column names
names(X_train) <- features[,2]

#Give subject_train a meaningful column name
names(subject_train) <- "Subject"

#Give y_train meaningful data points
y_train <- y_train[,1]
y_train <- as.character(y_train)
y_train <- replace(y_train, which(y_train == "1"), "Walking")
y_train <- replace(y_train, which(y_train == "2"), "Walking Upstairs")
y_train <- replace(y_train, which(y_train == "3"), "Walking Downstairs")
y_train <- replace(y_train, which(y_train == "4"), "Sitting")
y_train <- replace(y_train, which(y_train == "5"), "Standing")
y_train <- replace(y_train, which(y_train == "6"), "Laying")

y_train <- as.data.frame(y_train)

#Give y_train a meaningful column name
names(y_train) <- "ActivityType"

#Combine Training Data
TRAIN <- cbind(subject_train, y_train, X_train)

#Get Raw Signal Data
setwd("./Inertial Signals")
body_acc_x_train <- read.table("body_acc_x_train.txt")
body_acc_y_train <- read.table("body_acc_y_train.txt")
body_acc_z_train <- read.table("body_acc_z_train.txt")
body_gyro_z_train <- read.table("body_gyro_z_train.txt")
body_gyro_y_train <- read.table("body_gyro_y_train.txt")
body_gyro_x_train <- read.table("body_gyro_x_train.txt")
total_acc_x_train <- read.table("total_acc_x_train.txt")
total_acc_y_train <- read.table("total_acc_y_train.txt")
total_acc_z_train <- read.table("total_acc_z_train.txt")

#Create meaningful column names
colNames <- paste(rep("R", 128), c(1:128), sep = "")

#Give Raw Data Meaningful column names
names(body_acc_x_train) <- paste(colNames, " - bax")
names(body_acc_y_train) <- paste(colNames, " - bay")
names(body_acc_z_train) <- paste(colNames, " - baz")
names(body_gyro_z_train) <- paste(colNames, " - bgz")
names(body_gyro_y_train) <- paste(colNames, " - bgy")
names(body_gyro_x_train) <- paste(colNames, " - bgx")
names(total_acc_x_train) <- paste(colNames, " - tax")
names(total_acc_y_train) <- paste(colNames, " - tay")
names(total_acc_z_train) <- paste(colNames, " - taz")

#Combine all Training Data into single table
TRAIN <- cbind(TRAIN, body_acc_x_train, body_acc_y_train, body_acc_z_train, 
               body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, 
               total_acc_x_train, total_acc_y_train, total_acc_z_train)

#---------------------------------------------------------------------------------------------------------

#Get all Test Files
setwd("../")
setwd("../")
setwd("./test")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

#Give X_test meaningful column names
names(X_test) <- features[,2]

#Give subject_test a meaningful column name
names(subject_test) <- "Subject"

#Give y_test meaningful data points
y_test <- y_test[,1]
y_test <- as.character(y_test)
y_test <- replace(y_test, which(y_test == "1"), "Walking")
y_test <- replace(y_test, which(y_test == "2"), "Walking Upstairs")
y_test <- replace(y_test, which(y_test == "3"), "Walking Downstairs")
y_test <- replace(y_test, which(y_test == "4"), "Sitting")
y_test <- replace(y_test, which(y_test == "5"), "Standing")
y_test <- replace(y_test, which(y_test == "6"), "Laying")

y_test <- as.data.frame(y_test)

#Give y_test a meaningful column name
names(y_test) <- "ActivityType"

#Combine Training Data
TEST <- cbind(subject_test, y_test, X_test)

#Get Raw Signal Data
setwd("./Inertial Signals")
body_acc_x_test <- read.table("body_acc_x_test.txt")
body_acc_y_test <- read.table("body_acc_y_test.txt")
body_acc_z_test <- read.table("body_acc_z_test.txt")
body_gyro_z_test <- read.table("body_gyro_z_test.txt")
body_gyro_y_test <- read.table("body_gyro_y_test.txt")
body_gyro_x_test <- read.table("body_gyro_x_test.txt")
total_acc_x_test <- read.table("total_acc_x_test.txt")
total_acc_y_test <- read.table("total_acc_y_test.txt")
total_acc_z_test <- read.table("total_acc_z_test.txt")

#Create meaningful column names
colNames <- paste(rep("R", 128), c(1:128), sep = "")

#Give Raw Data Meaningful column names
names(body_acc_x_test) <- paste(colNames, " - bax")
names(body_acc_y_test) <- paste(colNames, " - bay")
names(body_acc_z_test) <- paste(colNames, " - baz")
names(body_gyro_z_test) <- paste(colNames, " - bgz")
names(body_gyro_y_test) <- paste(colNames, " - bgy")
names(body_gyro_x_test) <- paste(colNames, " - bgx")
names(total_acc_x_test) <- paste(colNames, " - tax")
names(total_acc_y_test) <- paste(colNames, " - tay")
names(total_acc_z_test) <- paste(colNames, " - taz")

#Combine all Test Data into single table
TEST <- cbind(TEST, body_acc_x_test, body_acc_y_test, body_acc_z_test, 
               body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, 
               total_acc_x_test, total_acc_y_test, total_acc_z_test)

#Combine Training and Test data
ALLDATA <- rbind(TRAIN, TEST)

#Find mean and std columns
mean <- grep("mean()", names(ALLDATA), fixed = TRUE)
std <- grep("std()", names(ALLDATA), fixed = TRUE)

index <- c(1, 2, mean, std)
index <- sort(index)

M_S <- ALLDATA[,index]

#Clean up variable names by removing parentheses and dashes
names(M_S) <- gsub("(", "", names(M_S), fixed = TRUE)
names(M_S) <- gsub(")", "", names(M_S), fixed = TRUE)
names(M_S) <- gsub("-", "", names(M_S), fixed = TRUE)


#Find mean for each variable by Subject and ActivityType
library(dplyr)
columns <- lapply(names(M_S)[1:2], as.symbol)
TIDY <- M_S %>% group_by_(.dots = columns) %>% summarise_each(funs(mean))

}
