#plot GSEA

gsea <- gsea_ALD_Down

head(gsea)
pathway <- gsea[1:10,]

library(stringr)
splt_name<- str_split_fixed(pathway$NAME, "MARK_", 2)
pathway$path_name <- splt_name[,2]

#用Fold.Enrichment做横坐标
library(ggplot2)
ggplot(pathway,aes(-1*ES,path_name)) +
  geom_point(aes(size=SIZE,color=FWER_p_val)) + 
  scale_color_gradient(low="red",high = "yellow") + 
  labs(color="p.val",size="Genes",  
       x="-ES",y="Pathway name",title="GSEA analysis") + 
  theme_bw() 


gsea <- gsea_ALD_UP

head(gsea)
pathway <- gsea[1:10,]

library(stringr)
splt_name<- str_split_fixed(pathway$NAME, "MARK_", 2)
pathway$path_name <- splt_name[,2]

#用Fold.Enrichment做横坐标
library(ggplot2)
ggplot(pathway,aes(ES,path_name)) +
  geom_point(aes(size=SIZE,color=FWER_p_val)) + 
  scale_color_gradient(low="red",high = "yellow") + 
  labs(color="p.val",size="Genes",  
       x="ES",y="Pathway name",title="GSEA analysis") + 
  theme_bw() 