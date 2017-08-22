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




w
# @sciencestream is a spambot that's RT'ing everything on the #ISMB tag. Get rid of those.
tweets <- tweets[which(tweets$screenName!="sciencestream"), ]

# Make a table of the number of tweets per user
d <- as.data.frame(table(tweets$screenName))
d <- d[order(d$Freq, decreasing=T), ]
names(d) <- c("User","Tweets")
head(d)

# Plot the table above for the top 40
png("ismb-users.png", w=700, h=1000)
par(mar=c(5,10,2,2))
with(d[rev(1:40), ], barplot(Tweets, names=User, horiz=T, las=1, main="Top 40: Tweets per User", col=1))
dev.off()

# Plot the frequency of tweets over time in two hour windows
# Modified from http://michaelbommarito.com/2011/03/12/a-quick-look-at-march11-saudi-tweets/
minutes <- 120
ggplot(data=tweets, aes(x=created)) + 
  geom_histogram(aes(fill=..count..), binwidth=60*minutes) + 
  scale_x_datetime("Date") + 
  scale_y_continuous("Frequency") +
  opts(title="#ISMB Tweet Frequency July 11-17", legend.position='none')
ggsave(file='ismb-frequency.png', width=7, height=7, dpi=100)