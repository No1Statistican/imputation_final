#forest's directory
#setwd("C:\\Users\\Owner\\Documents\\MEGA\\University of Maryland\\INST 737\\Project")
setwd("C:\\Users\\fores\\Documents\\MEGA\\University of Maryland\\INST 737\\Project")
full_auto<-read.csv("autos.csv",header=TRUE)
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

full_auto$price[full_auto$price>1000000 | full_auto$price==0]<-NA

completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}

full_auto2<-full_auto[!is.na(full_auto$price),]

num_rows<-nrow(full_auto2)
samp_size<-floor(num_rows*0.75)

set.seed(538)

train_ind <- sample(seq_len(nrow(full_auto2)), size = samp_size)

train <- full_auto2[train_ind, ]
test <- full_auto2[-train_ind, ]

#use for mean imputation
#train$price[is.na(train$price)]<-mean(train$price)

#change x later
'''
full_auto$price[full_auto$price==0]<-NA
full_auto1<-data.frame()
full_auto1$price<-na.omit(full_auto$price)

quar<-quantile(full_auto1$price,probs=seq(0.25,0.75,0.5))

quar_df<-as.data.frame(quar)

iqr<-1.5*(max(quar_df$quar)-min(quar_df$quar))

u_limit<-iqr+max(quar_df$quar)
l_limit<-min(quar_df$quar)-iqr
'''