library(AdhereR)
library(dplyr)
library(plyr)
library(lubridate)
library(latticeExtra)
library(data.table)
library(factoextra)
library(stats)

ExamplePats <- med.events
tidy <- ExamplePats
colnames(tidy) <- c("pnr", "eksd", "perday", "ATC", "dur_original")
tidy$eksd <- mdy(tidy$eksd)

arg1="medA"
See<- function(arg1){
  C09CA01 <- tidy[which(tidy$ATC == arg1),]
  # Take a random sequence of consecutive prescription in the dataset
  Drug_see_p0 = C09CA01
  Drug_see_p1 <- C09CA01
  Drug_see_p1 <- Drug_see_p1 %>% arrange(pnr,eksd) %>% 
    group_by(pnr) %>%  
    dplyr::mutate(prev_eksd = dplyr::lag(eksd, n=1, default =NA))
  Drug_see_p1 <- Drug_see_p1[!(is.na(Drug_see_p1$prev_eksd)),]
  Drug_see_p1 <- ddply(Drug_see_p1,.(pnr), function(x) x[sample(nrow(x),1),])
  Drug_see_p1 <- Drug_see_p1[,c("pnr","eksd","prev_eksd")] # only use the needed columns
  Drug_see_p1$event.interval <- Drug_see_p1$eksd - Drug_see_p1$prev_eksd # this is the date duration
  Drug_see_p1$event.interval <-as.numeric( Drug_see_p1$event.interval)
  per <- ecdfplot(~Drug_see_p1$event.interval) #. Generate the empirical cumulative  distribution plot
  x <- per$panel.args[[1]]
  ecdfs <- lapply(split(Drug_see_p1$event.interval,1),ecdf) # generating difference "cuts" of the original empirical cumulative distributions
  y <- sapply(ecdfs, function(e) e(Drug_see_p1$event.interval))
  y <- as.vector(y)
  x = unlist(x)
  x = as.numeric(x)
  dfper <- cbind(x,y)
  dfper<-as.data.frame(dfper)
  
  # Retain the 20% of the ECDF
  dfper <- dfper[which(dfper$y<=0.8),] # Remove the upper 20%? Should this be >=0.8?
  max(dfper$x)
  par(mfrow=c(1,2))
  plot(dfper$x, dfper$y, main = "80% ECDF") # Oh that’s why its <=0.8
  plot(x,y, main="100% ECDF")
  m1<-table(Drug_see_p1$pnr)
  plot(m1)
  ni<-max(dfper$x)
  Drug_see_p2<- Drug1_see_p1[which(Drug_see_p1$event.interval<=ni),]
  d<-density(log(as.numeric(Drug_see_p2$event.interval)))
  plot(d, main="Log(event interval)")
  x1<- d$x
  y1<-d$y
  z1<-max(x1)
  a<-data.table(x=x1,y=y1)
  a<-scale(a)
  
  # Silhouette Score
  set.seed(1234) # for reproducibility
  a2<- fviz_nbclust(a, kmeans, method = "silhouette") + labs (subtitle="Silhouette Analysis")
  plot(a2)
  max_cluster <- a2$data
  max_cluster <- as.numeric(max_cluster$clusters[which.max(max_cluster$y)])
  
  # K-means Clustering
  set.seed(1234)
  cluster<-kmeans(dfper$x, max_cluster)
  dfper$cluster<-as.numeric(cluster$cluster)
  tapply(log(dfper$x), dfper$cluster, summary)
  ni2<-tapply(log(dfper$x), dfper$cluster, min)
  ni3<-tapply(log(dfper$x), dfper$cluster, max) 
  ni2<-data.frame(Cluster=names(ni2), Results=unname(ni2))
  ni2$Results<-ifelse(is.infinite(ni2$Results) & ni2$Results<0, 0,ni2$Results)
  ni3<-data.frame(Cluster=names(ni3), Results=unname(ni3))
  ni3$Results<-as.numeric(ni3$Results)
  nif<-cbind(ni2,ni3)
  nif<-nif[,-3] 
  nif$Results<-exp(nif$Results) # Perform normal exponential since this was logged
  nif$Results.1<-exp(nif$Results.1)
  ni4<-tapply(log(dfper$x), dfper$cluster, median, na.rm=T)
  ni4<-data.frame(Cluster=names(ni4), Results=unname(ni4))
  nif<-merge(nif, ni4, by="Cluster")
  colnames(nif)<-c("Cluster","Minimum","Maximum","Median")
  nif$Median<- ifelse(is.infinite(nif$Median) & nif$Median<0, 0, nif$Median)
  nif<- nif[which(nif$Median>0),]
  results<-Drug1_see_p1 %>% cross_join(nif) %>% mutate(Final_cluster = ifelse(event.interval>=Minimum & event.interval<= Maximum, Cluster, NA))
  results = results[which(!is.na(results$Final_cluster)),]
  results$Median<-exp(results$Median)
  results<-results[,c("pnr","Median","Cluster")]
  t1<-as.data.frame(table(results$Cluster))
  t1<-t1%>%arrange(-Freq)
  t1<-as.numeric(t1$Var1[1])
  t1<-as.data.frame(t1)
  colnames(t1)<-"Cluster"
  t1
  t1$Cluster <- as.numeric(t1$Cluster)
  results$Cluster <- as.numeric(results$Cluster)
  t1_merged = merge(t1,results, by="Cluster")
  t1_merged = t1_merged [1,]
  t1_merged <- t1_merged[,-2]
  t1 = t1_merged
  Drug_see_p1<-merge(Drug_see_p1, results, by = "pnr", all.x=T)
  Drug_see_p1$Median<-ifelse(is.na(Drug_see_p1$Median), t1$Median,Drug_see_p1$Median)
  Drug_see_p1$Cluster<-ifelse(is.na(Drug_see_p1$Cluster), "0", Drug_see_p1$Cluster)
  Drug_see_p1$event.interval<-as.numeric(Drug_see_p1$event.interval)
  Drug_see_p1$test<-round(Drug_see_p1$event.interval-Drug_see_p1$Median,1)
  
  Drug_see_p3<-Drug_see_p1[,c("pnr","Median","Cluster")]
  
  # Assign Duration
  Drug_see_p0<-merge(Drug_see_p0, Drug_see_p3, by="pnr", all.x=T)
  Drug_see_p0$Median<-as.numeric(Drug_see_p0$Median)
  Drug_see_p0$Median<-ifelse(is.na(Drug_see_p0$Median), t1$Median,Drug_see_p0$Median)
  Drug_see_p0$Cluster<-ifelse(is.na(Drug_see_p0$Cluster),0,Drug_see_p0$Cluster)
  
  return(Drug_see_p0)
}

arg1=medA

see_assumption<-function(arg1){
  arg1 <- arg1 %>% arrange(pnr,eksd) %>% 
    group_by(pnr) %>%  
    dplyr::mutate(prev_eksd = dplyr::lag(eksd, n=1, default =NA))
  Drug_see2<- arg1 %>% # Replace here
    group_by(pnr) %>%
    arrange(pnr, eksd) %>% dplyr :: mutate(p_number=seq_along(eksd))
  Drug_see2 <- Drug_see2[which(Drug_see2$p_number>=2),]
  Drug_see2 <-Drug_see2[,c("pnr","eksd","prev_eksd","p_number")]
  Drug_see2$Duration <-Drug_see2$eksd-Drug_see2$prev_eksd
  Drug_see2$p_number <- as.factor(Drug_see2$p_number)
  pp <- ggplot(Drug_see2, aes(x=p_number, y=Duration)) + geom_boxplot() + theme_bw()
 
  medians_of_medians <- Drug_see2 %>%
    group_by(pnr) %>%
    summarise(median_duration = median(Duration, na.rm = TRUE))
  
  pp <- ggplot(Drug_see2, aes(x=p_number, y=Duration)) + geom_boxplot() + 
    geom_hline(yintercept = as.numeric(medians_of_medians$median_duration), linetype = "dashed", color = "red") +  # Horizontal line
    theme_bw() 
  return(pp)
}


 

medA = See("medA")
medB = See("medB")

see_assumption(medA)
see_assumption(medB)
