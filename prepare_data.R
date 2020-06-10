
# prepare data for hotspot analysis direct from DESeq analysis
genes<-as.character(unique(all_sig$row))
genes<-data.frame(do.call('rbind', strsplit(genes,'.',fixed=TRUE)))
genes$X2<-1
colnames(genes)<-c("GeneID", "Riband_STB")
write.csv(genes, "~/Documents/STB_hotspot/riband_expression_scores.csv", row.names=F)
