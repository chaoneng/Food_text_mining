nameList <- list.files("C:/text_result/")
z=c() # 設為空�? 
a=c() 
for (i in 1:length(nameList)) {
  z=rbind.fill(z,
               read.csv(paste0("C:/text_result/",nameList[i]),header = F,stringsAsFactors=FALSE,quote = "",na.strings=c("NA","NaN", " ")))
}

df <- sapply(z, as.character)
df[is.na(df)] <- " "
df=as.data.frame(df)

word1=mapply(gsub,'(\\w) (\\d)','\\1-\\2',df)
word1=as.data.frame(word1)
word2=mapply(gsub,'(\\d) (\\w)','\\1-\\2',word1)
word2=as.data.frame(word2)
word3=mapply(gsub,'(\\w) (\\w)','\\1-\\2',word2)
word3=as.data.frame(word3)
word4=mapply(gsub,'(\\d) (\\d)','\\1-\\2',word3)

for (i in 1:nrow(word4)) {
  a[i]=paste0("",word4[i,], collapse = "")
  
}
a=as.data.frame(a)

t1=cSplit(a,'a'," ")


