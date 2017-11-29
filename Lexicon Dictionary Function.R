install.packages("rvest")  //installing the package rvest for web scraping
install.packages("dplyr")
library(dplyr)
library(rvest)

##creating a lexicon file and saving it 

url<-"https://www.powerthesaurus.org/surprise/synonyms/"        //getting the words from a dictionary page 
A <- NULL
N_pages<-52                                                     //considering the no of web pages to be 52
D<-NULL
for (j in 2: N_pages){
  pixel <- read_html(paste0(url, j)) 
  B <- cbind(pixel %>% html_nodes(".topic-link span , .topic-link") %>%     html_text()     )       //using selector gadget to get words
  A <- rbind(A,B)                                                                                   //binding into a final matrix
}

write(A, file="surprise_words.txt")                              //saving the file into local system
