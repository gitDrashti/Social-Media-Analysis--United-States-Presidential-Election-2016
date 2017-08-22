tweets_trump <- searchTwitter("donald Trump",n=15000, lang = "en")
write.csv(tweets_trump,"tweets_trump.csv")
tweetdataframe <- do.call("rbind",lapply(tweets_trump,as.data.frame))
write.csv(tweetdataframe,"trumpdetails.csv",sep="t")

tweets_hillary <- searchTwitter("Hillary Clinton",n=15000, lang = "en")
write.csv(tweets_hillary,"tweets_hillary.csv")
tweetdataframe <- do.call("rbind",lapply(tweets_hillary,as.data.frame))
write.csv(tweetdataframe,"hillarydetails.csv",sep="t")