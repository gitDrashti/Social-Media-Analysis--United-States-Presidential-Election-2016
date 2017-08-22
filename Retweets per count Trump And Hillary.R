require(tm)
library(wordcloud)
library(ggplot2)
library(tm)
library(httpuv)
library(ggplot2)

tl.df <- read.csv('trumpdetails.csv', row.names=1)
ggplot(tl.df, aes(x=retweetCount)) + geom_histogram(binwidth=0.1, fill='green') + geom_smooth(stat='bin', binwidth=0.1, colour='darkgreen') + geom_histogram(aes(x=favoriteCount), fill='blue', binwidth=0.1, alpha=0.5) + scale_x_log10() + ggtitle('Donald Trump')

tl_1.df <- read.csv('hillarydetails.csv', row.names=1)
ggplot(tl_1.df, aes(x=retweetCount)) + geom_histogram(binwidth=0.1, fill='orange') + geom_smooth(stat='bin', binwidth=0.1, colour='darkgreen') + geom_histogram(aes(x=favoriteCount), fill='blue', binwidth=0.1, alpha=0.5) + scale_x_log10() + ggtitle('Hillary Clinton')