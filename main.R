#forest's directory
setwd("C:\\Users\\Owner\\Documents\\MEGA\\University of Maryland\\INST 737\\Project")
full_auto<-read.csv("outlier_values <- boxplot.stats(inputData$pressure_height)$outautos.csv",header=TRUE)
names(full_auto)

full_auto$dateCrawled<-NULL
full_auto$ID<-seq.int(nrow(full_auto))

full_auto[full_auto==""]<-NA

full_auto$dateCreated<-NULL
full_auto$lastSeen<-NULL
full_auto$nrOfPictures<-NULL
full_auto$seller<-NULL
full_auto$abtest<-NULL
full_auto$offerType<-NULL

#change x later
#full_auto$pricec[full_auto$price>x or full_auto$price==0]<-NA

full_auto$price[full_auto$price==0]<-NA
full_auto1<-data.frame()
full_auto1$price<-na.omit(full_auto$price)

quar<-quantile(full_auto1$price,probs=seq(0.25,0.75,0.5))

quar_df<-as.data.frame(quar)

iqr<-1.5*(max(quar_df$quar)-min(quar_df$quar))

u_limit<-iqr+max(quar_df$quar)
l_limit<-min(quar_df$quar)-iqr
