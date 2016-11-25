
train = list.files(pattern = "train",recursive = TRUE)
test = list.files(pattern = "test",recursive = TRUE)

$Reading data
subtrain = read.table(train[10])
xtrain = read.table(train[11])
ytrain = read.table(train[12])

subtest = read.table(test[10])
xtest = read.table(test[11])
ytest = read.table(test[12])

activity = read.table(list.files(pattern="activity"))
features = read.table(list.files(pattern="features.txt"))

%merging data

subject = rbind(subtrain,subtest)
subactivity = rbind(ytrain,ytest)
subfeatures = rbind(xtrain,xtest)

names(subject) = "subject"
names(subactivity) = "activity"
names(subfeatures) = features$V2

data = cbind(subject, subactivity, subfeatures)

%mean() and std()
mean_std = grep("mean\\(\\)|std\\(\\)", features$V2)
data = cbind(data[,1:2],data[ ,2 + mean_std])

$descriptive Activity Names
data$activity = factor(data$activity)
levels(data$activity) = levels(activity$V2)

$descriptive Variable Names
names(data) = gsub("Acc","Acceleration",names(data))
names(data) = gsub("^t","Total",names(data))
names(data) = gsub("Gyro","Gyroscopic",names(data))
names(data) = gsub("^f","Frequency",names(data))

%tidy data
tidydata = (aggregate(.~subject+activity,data,mean))
tidydata = data[order(tidydata$subject,tidydata$activity),]
write.table(tidydata,"tidyData.txt",row.name=FALSE)


