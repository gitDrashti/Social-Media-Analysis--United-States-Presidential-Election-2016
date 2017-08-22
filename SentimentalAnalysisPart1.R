library(plyr)
library(stringr)
tweets_trump.text<-laply(tweets_trump,function(t)t$getText())
tweets_hillary<-read.csv("tweets_hillary.csv")

pos<- scan('C:/Users/Pinank/Desktop/JavaApplication1/Election_Analysis _2016/wordbanks/positive-words.txt',what = 'character', comment.char = ';')
#Read 2006 items
neg<- scan('C:/Users/Pinank/Desktop/JavaApplication1/Election_Analysis _2016/wordbanks/negative-words.txt',what = 'character', comment.char = ';')
#Read 4783 items


#Apply JeffreyBEEN's Algoritham for analysis.link: https://jeffreybreen.wordpress.com/2011/07/04/twitter-text-mining-r-slides/
source('sentiment_new.r')

result_trump<-score.sentiment(tweets_trump.text,pos,neg)
result_hillary<-score.sentiment(tweets_hillary$x,pos,neg)

table_trumo<-table(result_trump$score)
table_hillary<-table(result_hillary$score)