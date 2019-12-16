  data <- read.csv(file.choose(),header = T)
  str(data)
  
  #build Corpus
  library(tm)
  corpus <- iconv(data$text ,to = "UTF-8")
  corpus <- Corpus(VectorSource(corpus))
  inspect(corpus[1:5])
  
  #clean_text
  corpus <- tm_map(corpus,tolower)
  corpus <- tm_map(corpus,removePunctuation)
  corpus <- tm_map(corpus,removeNumbers)
  
  inspect(corpus[1:5])
  cleanSet <- tm_map(corpus,removeWords,stopwords('english'))
  inspect(cleanSet[1:5])
  
  removeURL <- function(x) gsub('http[[:alnum:]]*','',x)
  cleanSet <- tm_map(cleanSet, content_transformer(removeURL))
  inspect(cleanSet[1:5])
  
  cleanSet <- tm_map(cleanSet,removeWords,c('ayodhya','verdict','ranaayyub'))
  cleanSet <- tm_map(cleanSet,stripWhitespace)
  
  inspect(cleanSet[1:5])
  
  #TERM doc matrix
   tdm <- TermDocumentMatrix(cleanSet)
   tdm
   tdm <- as.matrix(tdm)
   tdm[1:10,1:15]
  
   
   # Bar Plot
   w <- rowSums(tdm)
   w <- subset(w, w>=25)
   barplot(w,las=2,col = rainbow(10))
   
   #word cloud 
   library(wordcloud)
   w<- sort(rowSums(tdm),decreasing = TRUE)
   set.seed(222)
   wordcloud( words = names(w) , freq=w, colors = brewer.pal(8,'Dark2'))
   
   