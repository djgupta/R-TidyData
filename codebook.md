This is the codebook on how raw data was converted into the needed tidy data.
All variables are under quotation marks.

$Dataset
We set our data folder as the working directory.
Or data folder contains activity files, feature files, test folders and train folders.
For more knowledge, refer to "README.txt" in the data folder.

$Read Data
We create the variable "train" using list.files() function with pattern set as 'train'.
We create the variable "test" using list.files() function with pattern set as 'test'.
We read data from the "train" varible into "subtrain", "xtrain" and "ytrain" using the function read.table().
We read data from the "test" varible into "subtest", "xtest" and "ytest" using the function read.table().
We read data from the activity file into the variable "activity".
We read data from the features file into the variable "features".

$Merge Data
We create the variable "subject" and row-wise merge the dataset of "subtrain" and "subtest".
We create the variable "subjfeatures" and row-wise merge the dataset of "xtrain" and "ytest".
We create the variable "subactivity" and row-wise merge the dataset of "xtrain" and "ytest".
We change the names of "subject", "subfeatures" and "subactivity" for ease of usage.
Now, we create the variable "data" by columnwise merging the data of "subject", "subactivity" and "subfeatures".

$Getting mean() and std() data
We create the "mean_std" variable using grep function. We extract indices of those features which contain mean() and std().
Now, we recreate the variable "data". We use cbind to merge the column of subjects, activity and the features.

$Descriptive Activity Names
We factorise our "data$activity" and put into the same variable "data$activity",
Then, we feed the levels of "activity$V2" into the levels of "data$activity". This enables the "data$activity" to contain descriptive words instead of Integers.

$Descriptive Variable Names
Now, we change the names in our "data" varable using gsub function. This allows descriptive names and thus easier to understand.

$Tidy Data
We create the variable "tidydata" using the aggregate function.
We take the mean of the feature variable for each subject and its respective activities. This means that for subject1 and his activity1, we get the mean of each of the features.
Now, we order our "tidydata" by subject and then activity.
We extract a "tidydata.txt" using write.table(); 








