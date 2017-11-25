install.packages("rvest")
install.packages("dplyr")
library(dplyr)
library(rvest)

##creating a lexicon file and saving it 

url<-"https://www.powerthesaurus.org/surprise/synonyms/"
A <- NULL
N_pages<-52
D<-NULL
for (j in 2: N_pages){
  pixel <- read_html(paste0(url, j)) 
  B <- cbind(pixel %>% html_nodes(".topic-link span , .topic-link") %>%     html_text()     )
  A <- rbind(A,B)
}

write(A, file="surprise_words.txt")
