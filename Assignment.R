library(base)
##Loading and preprocessing the data
dataURL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
temp <- tempfile()
download.file(DataURL, temp)
unzip(temp, "activity.csv")
Data <- read.csv("activity.csv")
unlink(temp)
head(Data)
str(Data)
cData<- Data[complete.cases(Data),]
head(cData)
## What is mean total number of steps taken per day?
####the missing values in the dataset are ignored
Data$date <- as.Date(Data$date , "%Y-%m-%d")
ccData<-Data[order(Data$date),]
head(ccData)
stepsPerDay<-aggregate(ccData$steps , by = list(ccData$date), FUN="mean")
head(stepsPerDay)

##Calculate the total number of steps taken per day

totalStepsPerDay<-aggregate(ccData$steps , by = list(ccData$date), FUN="sum")
head(totalStepsPerDay)


#Make a histogram of the total number of steps taken each day
with(totalStepsPerDay, hist(step))
     
     hist(SelectData$Global_active_power, main ="Global Active Power" , xlab ="Global Active Power 
Calculate and report the mean and median of the total number of steps taken per day
What is the average daily activity pattern?

Make a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
Imputing missing values

Note that there are a number of days/intervals where there are missing values (coded as 𝙽𝙰). The presence of missing days may introduce bias into some calculations or summaries of the data.

Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with 𝙽𝙰s)
Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.
Create a new dataset that is equal to the original dataset but with the missing data filled in.
Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?
Are there differences in activity patterns between weekdays and weekends?

For this part the 𝚠𝚎𝚎𝚔𝚍𝚊𝚢𝚜() function may be of some help here. Use the dataset with the filled-in missing values for this part.

Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.
Make a panel plot containing a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.





















Data<-fread("household_power_consumption.txt", header=T)
str(Data)
Data$Date <- as.Date(Data$Date , "%d/%m/%Y")
cData<-Data[order(Data$Date),]
str(cData)
SelectData<-cData[Date %between% c("2007-02-01", "2007-02-02")]
str(SelectData)
SelectData$Global_active_power<-as.numeric(SelectData$Global_active_power)
cSelectData<-SelectData[order(SelectData$Global_active_power),]
str(cSelectData)
png(file="plot1.png",width=480,height=480)
hist(SelectData$Global_active_power, main ="Global Active Power" , xlab ="Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()

