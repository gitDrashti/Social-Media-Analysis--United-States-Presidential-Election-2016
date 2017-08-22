library(plyr)
library(ggplot2)
read.csv("hillarydetails.csv")
tweets <- read.csv("trumpdetails.csv")
dates <- paste("2016-07",11:18,sep="") # need to go to 18th to catch tweets from 17th
for (i in 2:length(dates)) {
  print(paste(dates[i-1], dates[i]))
  tweets <- c(tweets, searchTwitter("DonaldTrump+USElection", since=dates[i-1], until=dates[i], n=1500))
}

# Convert the list to a data frame
tweets <- twListToDF(tweets)
tweets <- unique(tweets)

# To ensure accuracy, make sure that there were no more than 1500 tweets in a single day.
# If there are 1500 on any single day, then you're truncating that day's tweets, and you'll
# need to try to get ROAuth (below) working.
tweets$date <- format(tweets$created, format="%Y-%m-%d")
w<-table(tweets$date)
write.csv()
w<-tweets$date

write.csv(w,file = "w.csv")

byHourOfDay <-ddply(df, ~created, summarise,
                    tweetCount = length(text),
                    retweetSum = sum(retweetCount), retweetMean = mean(retweetCount), retweetSd = sd(retweetCount), retweetMax = max(retweetCount))
#View(byHourOfDay)
write.csv(byHourOfDay,"countperday.csv")
#Plotting...
library(reshape2)
countperday<-read.csv("countperday.csv")
final<-c(day,count)
melt(final)


# countperday
#totalcount  day
#1       6329 day1
#2       9540 day2
#3      10966 day3
#4      12632 day4
#5      15000 day5

a<-melt(countperday)

# a
#day   variable value
#1 day1 totalcount  6329
#2 day2 totalcount  9540
#3 day3 totalcount 10966
#4 day4 totalcount 12632
#5 day5 totalcount 15000
 a$variable<-NULL
 a
#day value
#1 day1  6329
#2 day2  9540
#3 day3 10966
#4 day4 12632
#5 day5 15000
mat<-as.matrix(a)
plot(a$day,a$value)
plot(a$day,a$value,col=rainbow(10))
plot(a$day,a$value,main="RetweetCount per Day Donald Trump")

################################################
countperday<-read.csv("counthillarydetail.csv")
final<-c(day,count)
melt(final)


# countperday
#totalcount  day
#1       6329 day1
#2       9540 day2
#3      10966 day3
#4      12632 day4
#5      15000 day5

a<-melt(countperday)

# a
#day   variable value
#1 day1 totalcount  6329
#2 day2 totalcount  9540
#3 day3 totalcount 10966
#4 day4 totalcount 12632
#5 day5 totalcount 15000
a$variable<-NULL
a
#day value
#1 day1  6329
#2 day2  9540
#3 day3 10966
#4 day4 12632
#5 day5 15000
mat<-as.matrix(a)
plot(a$day,a$value)
plot(a$day,a$value,col=rainbow(10))
plot(a$day,a$value,main="RetweetCount per Day Hillary Clinton")
