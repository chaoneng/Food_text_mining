library(xlsx)
library(arules)

demo  <- read.transactions("c:/text/test.txt",format = "basket", sep="")
head(demo)


#####apriori
itemFrequencyPlot(demo,topN=20,type="absolute")
rules <- apriori(demo, parameter = list(supp = 0.001, conf = 0.5,minlen = 2))

options(digits=5)
inspect(rules[1:10])

#####top k accosation
library(opusminer)
result=opus(demo,format = "itemsets")
inspect(result[1:20])

###############
library(RColorBrewer)
library(wordcloud)
product_name <- itemLabels(demo)
product_cnt <- itemFrequency(demo)*1000
col.pal <- brewer.pal(9, "Blues")
wordcloud(words = product_name, freq = product_cnt, min.freq = 1, scale = c(3,0.5), col = col.pal , random.order = FALSE)

##########
library(ggplot2)
library(arulesViz)
plot(rules)
plot(rules, method="graph", control=list(type="items"))
plot(rules, method="grouped")
plot(rules,method='grouped',
     control = list(col=rev(brewer.pal(9, "Greens")[4:9])))
plot(rules, method="paracoord", control=list(reorder=TRUE))

