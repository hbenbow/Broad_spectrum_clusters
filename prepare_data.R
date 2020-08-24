
all <- read.csv("~/Documents/Broad_spectrum_clusters/Raw_data/all_data.csv", header=T)
all$DE<-1
sub<-all[,c(9, 8, 10)]
expression_scores<-spread(sub, key="Factor", value="DE", fill=0)
genes<-as.character(unique(expression_scores$Gene))
genes<-data.frame(do.call('rbind', strsplit(genes,'.',fixed=TRUE)))
genes$X2<-1
expression_scores$Gene<-genes$X1
genes<-data.frame(do.call('rbind', strsplit(genes,'.',fixed=TRUE)))
studies<-colnames(expression_scores)
studies<-gsub(" ", ".", studies)
colnames(expression_scores)<-studies

write.csv(expression_scores, file="~/Documents/Broad_spectrum_clusters/Raw_data/expression_scores.csv", row.names=F)
