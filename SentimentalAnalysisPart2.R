table_trumo<-table(!result_trump$score<0)
 names(table_trumo)<-c("negative","positive")
 table_trumo1<-table(result_trump$score==0)
 names(table_trumo1)<-c("other","nutral")
 posit_d<-table_trumo["positive"]-table_trumo1["nutral"]
 negat_d<-table_trumo["negative"]
 nutral_d<-table_trumo1["nutral"]
 final_d<-c(posit_d,nutral_d,negat_d)
 barplot(final_d,main = "Sentimental Analysis about Donald Trump",col = rainbow(20), ylim=c(0,9000), xlab = "Analysis", ylab = "Counts")
 
 #Analysis About Hillary Clinton
 table_hillary<-table(!result_hillary$score<0)
 names(table_hillary)<-c("negative","positive")
 table_hillary1<-table(result_hillary$score==0)
 names(table_hillary1)<-c("other","nutral")
 posit_h<-table_hillary["positive"]-table_hillary1["nutral"]
 negat_h<-table_hillary["negative"]
 nutral_h<-table_hillary1["nutral"]
 final_h<-c(posit_h,nutral_h,negat_h)
 barplot(final_h,main = "Sentimental Analysis about Hillary Clinton",col = rainbow(20), ylim=c(0,9000), xlab = "Analysis", ylab = "Counts")
 
 #comparision 
 positive<-c(posit_d,posit_d)
 nutral<-c(nutral_d,nutral_h)
 negative<-c(negat_d,negat_h)
 final<-c(positive,nutral,negative)
 barplot(final,main = "Donald vs. Clinton",col = rainbow(20), ylim=c(0,9000), xlab = "DonaldTrump vs. Clinton", ylab = "Counts")
 