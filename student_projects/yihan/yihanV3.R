
# useful resources --------------------------------------------------------

# http://www.cse.chalmers.se/~chrdimi/downloads/web/getting_web_data_r4_parsing_xml_html.pdf
# https://towardsdatascience.com/tidy-web-scraping-in-r-tutorial-and-resources-ac9f72b4fe47 
# https://tidyr.tidyverse.org/articles/rectangle.html 
# https://towardsdatascience.com/web-scraping-tutorial-in-r-5e71fd107f32

# load libraries ----------------------------------------------------------


library(tidyverse)
library(xml2)
library(rvest)


# load data ---------------------------------------------------------------

url <- "./student_projects/yihan/data.html"
# read the html
sil_output<-read_html(url) 
# str(sil_output)


# ID the nodes ------------------------------------------------------------

# This will tell you each of the nodes nested under each section
body_nodes <- sil_output %>% 
  html_node('.itx_Words') %>% # could also do this using 'p' tag
  html_children()
body_nodes
body_nodes[1]
body_nodes[2]
body_nodes[3]
# extract sentence and sentence no. ---------------------------------------


# this will get you the values for the number of each sentence, the sentnce
# and then bind together in a dataframe
htm_frame_number <- sil_output %>% 
  rvest::html_nodes('body') %>%  # this tells you that in the "body" of the html
  # (as opposed to the header)...to the look for the 'span class' where the
  # and extract the itx_Frame_number. This is the number of the sentence.
  xml2::xml_find_all("//span[contains(@class, 'itx_Frame_Number')]") %>% 
  rvest::html_text()

# result is a vector with all the table numbers
htm_frame_number

# This does the same thing, but looks for the class and code associated with 
# the translation of the phrase. Note this is a 'div class', not a 'span class'
sentence <- sil_output %>% 
  rvest::html_nodes('body') %>% 
  xml2::xml_find_all("//div[contains(@class, 'itx_Freeform_gls')]") %>% 
  rvest::html_text()


# result is a vector with all the sentences
sentence

# this binds the two of them and puts in a df. 
sentences_eng <- data.frame(htm_frame_number, sentence)
sentences_eng$htm_frame_number<-as.integer(sentences_eng$htm_frame_number)
sentences_eng$sentence_number<-seq(1:nrow(sentences_eng))

# view(sentences_eng)
# colnames(sentences_eng)
sentences_eng<-sentences_eng %>% select(htm_frame_number, sentence_number, sentence)
#  You can save this as a csv!



# extract data for each word and morpheme ---------------------------------


# With this next section we will extract the data for each sentence. Because
# we will have the number of each sentence, we will be able to associate 
# back to the actual phrase 

# This puts all of the data for a given frame(sentence) in a single element
# of a list.
results <- sil_output %>% html_nodes('.itx_Words')
results[1]

# this creates a list to put the words from each phrase in. 
# It is as long as the number of sentences 
word_vector <- vector("list",length = length(results))
gloss_vector <- vector("list",length = length(results))
# this creates a dataframe to store sentence number in
sent_count <- data.frame(matrix(NA, nrow=length(results), ncol=1))
names(sent_count) <-c("sentence_number")

for (i in seq_along(results)) {
  
  # pulls the number of the sentence (each is in a table)
   # sentence_number <- results[i] %>% 
   #  xml2::xml_find_first(".//span[contains(@class, 'itx_Frame_Number')]") %>% 
   #  rvest::html_text()
   # sent_count[i] <- sentence_number # add to the df
   # 
     # This takes each of the words in the sentence and converts to text
  words <- results[i] %>% 
    xml2::xml_find_all(".//td[contains(@class, 'itx_txt')]") %>% 
    rvest::html_text()
  # This will trim the ascii nonbreak spaces (can't just use trimws)
  words<-str_trim(words)
 word_vector[[i]] <- words # adds the words for that sentence to the list 
  
  gloss <- results[i] %>% 
    xml2::xml_find_all(".//td[contains(@class, 'itx_gls')]") %>% 
    rvest::html_text()
  gloss<-str_trim(gloss)
  gloss_vector[[i]] <- gloss
  
  
  
  
}  
library(repurrrsive)    

# extract words from list to dataframe
words_orig <- tibble(word = word_vector) %>% 
  unnest_wider(word,names_repair = "check_unique",
               names_sep="_") 
# a row with sentence number
words_orig$sentence_number<-seq(1:nrow(words_orig))
words_orig
# go from wide to long
words_orig <- words_orig %>% 
  pivot_longer(word_1:word_22,names_to = "word") %>% 
  rename("word_orig"="value")


# now extract gloss from list to daataframe
gloss_eng <- tibble(def = gloss_vector) %>% 
  unnest_wider(def,names_repair = "minimal")
# change coln names
names(gloss_eng)<-paste("word",seq(1:ncol(gloss_eng)),sep="_")
# add a column with sentence number
gloss_eng$sentence_number<-seq(1:nrow(gloss_eng))
gloss_eng
# go from wide to long form
gloss_eng <- gloss_eng %>% 
  pivot_longer(word_1:word_22,names_to = "word") %>% 
  rename("gloss"="value")


# bind them up
dictionary<-left_join(words_orig,gloss_eng) %>% 
  drop_na() %>% 
  mutate(word_number=row_number()) %>% 
  select(-word) %>% 
  group_by(sentence_number) %>% # these next two add a 
  mutate(word_in_sent = row_number()) %>% # counter for each word in sentence
  ungroup()

dictionary <- dictionary %>% 
  select(word_number, sentence_number,word_in_sent,gloss,word_orig)



# adding morphemes --------------------------------------------------------

# need to add the morphemes

morph_vector <- list()

for (i in seq_along(results)) {
  morphs_from_result <- results[i] %>% 
  xml2::xml_find_all(".//td[contains(@class, 'itx_morphemes')]") %>% 
  rvest::html_text(trim=TRUE) %>% 
  str_split("\n")
  morph_vector <- append(morph_vector, list(morphs_from_result))
  }


   


morph_df <- data.frame(morpheme1=NA,
                       dictionary_entry=NA, 
                       gloss=NA,
                       lexical_cat=NA,
                       sentence_number=NA,
                       word_in_sent=NA)
# i is the 'sentence loop'
for (i in 1:length(morph_vector)) {
# for (i in 1:59) {  
  # this checks to see if therte are actually words in a sentence.
  # (see frame 19) if not (words==0), then it skips to the next sentence.
size_morph_vector<-lengths(morph_vector[i])
  if (size_morph_vector==0) {
  next
  }
# j is the 'words within sentence loop'
  for (j in seq_along(1:size_morph_vector)) {

  temp_list<-morph_vector[[i]][[j]]
  temp_list<-as.data.frame(temp_list)
  temp_list$temp_list<-str_trim(temp_list$temp_list)
  idx<-c(1,2,3,4)
  category<-c("morpheme1","dictionary_entry","gloss","lexical_cat")
  temp_list<-
    temp_list %>% 
    mutate(temp_list=ifelse(temp_list=="",NA,temp_list)) %>% 
    mutate(morpheme=(cumsum(is.na(temp_list)==TRUE))+1) %>% 
    filter(is.na(temp_list)==FALSE) %>% 
    group_by(morpheme) %>% 
    mutate(def = ifelse(row_number() %in% idx, category, def))
  # temp_list$def<-rep(c("morpheme1","dictionary_entry","gloss","lexical_cat"),max(temp_list$morpheme))
  
  morphs<-temp_list %>% pivot_wider(names_from=def, values_from = temp_list)
  morphs$sentence_number=i
  morphs$word_in_sent=j
  # temp_list<-append(temp_list,temp_list)
  morph_df<-bind_rows(morph_df,morphs)
  }
}

head(morph_df)

morph_df<-morph_df %>% filter(is.na(morpheme1)==FALSE)
head(dictionary)
head(morph_df)
dictionary<-full_join(dictionary,morph_df,by=c("sentence_number","word_in_sent"))
head(dictionary)
# view(dictionary)

dictionary<-dictionary %>% 
# mutate(gloss.y=ifelse(gloss.y==gloss.x,gloss.y,gloss.y)) %>% 
  rename("word_gloss"="gloss.x", 
         "morph_gloss"="gloss.y",
         "morph_number"="morpheme",
         "morpheme"="morpheme1") 

sentences_eng
dictionary<-full_join(dictionary,select(sentences_eng,htm_frame_number,sentence_number))

dictionary <- dictionary %>% select(word_number,
                                    htm_frame_number,
                                    sentence_number,
                                    word_in_sent,
                                    word_gloss,
                                    lexical_cat,
                                    word_orig,
                                    morph_number,
                                    morpheme,
                                    dictionary_entry,
                                    morph_gloss)


all_together<-full_join(sentences_eng,dictionary)
# view(all_together)




# final products ----------------------------------------------------------

dictionary
sentences_eng


# save files as csv -------------------------------------------------------

write_csv(dictionary, "./student_projects/yihan/dictionary.csv") 

# updating the dictionary -------------------------------------------------


# Note this is better done in a different file

# you can put in a line of code making any 
# changes, updates, corrections, or additions











# to learn a bit more about structure of HTM files ------------------------


# HTM File ----------------------------------------------------------------


# library(rvest) # part of tidyverse
# library(XML)
# library(tidyverse)
# 
# # parsing an html document with 'xmlParse()'
# doc4 = xmlParse("./student_projects/yihan/data.html", isHTML = TRUE)
# class(doc4)
# 
# # parsing an html document into an R structure
# doc6 = htmlTreeParse("./student_projects/yihan/data.html")
# 
# 
# 
# url <- "./student_projects/yihan/data.html"
# webpage <- read_html(url)
# webpage
# 
# library(magrittr)
# results<-webpage %>% 
#   html_nodes(".itx_Words") %>% 
#   extract2(1)
# results
# 
# # parsing an html document 
# doc5<-htmlParse(url)
# class(doc5)
# # parsing an html document into an R structure
# root<-xmlRoot(doc5)
# xmlSize(root)
# movie_child = xmlChildren(root)
# xmlSApply(root, xmlName)
# # how many nodes in each children
# xmlSApply(root, xmlSize)
# # get the html body node
# mailing_body = xmlChildren(root)$body
# # get all 'h1' elements
# xpathSApply(mailing_body, "h1")
# # get all 'h2' elements
# xpathSApply(mailing_body, "h2")
# # get the html table 'Special Interest Groups'
# sig_content = readHTMLTable(doc5, which = 1)
# # SIG table from doc 'HTMLInternalDocument'
# sig_from_doc = xpathSApply(doc5, "//table/..//td") # just the word
# sig_from_doc = xpathSApply(doc5, "//table/..//span") # below the word
# sig_from_doc = xpathSApply(doc5, "//span") # the number of the sentence
# sig_from_doc[[1]]
# # SIG table from root 'XMLInternalElementNode'
# sig_from_root = xpathSApply(root, "//table/..//span")
# sig_from_root[[1]]
# 
# head(sig_from_doc,n=2)
# # names of SIG links
# sapply(sig_from_root, xmlValue)
# # names of SIG links
# foo<-sapply(sig_from_root, xmlValue)
# # Extracting a elements in table
# # XPath expression to extract 'a' nodes
# sig_links = xpathSApply(root, "//table/..//span")
# head(sig_links, n = 4)
# # XPath expression attributes of nodes
# sig_link_attrs = xpathSApply(root, "//table/..//span", xmlAttrs)
# head(sig_link_attrs)
# sig_link_attr_vals = xpathSApply(root, "//table/..//span", xmlGetAttr, "class")
# head(sig_link_attr_vals, n = 3)
# 
# # XPath expression to extract content from nodes
# sig_link_values = xpathSApply(root, "//table/..//span", xmlValue)
# sig_link_values
# sig_link_values[6]


# .itx_Words { }
# .itx_Frame_Number { }
# .itx_Frame_Word { margin: 10px 5px 10px 5px; }
# .itx_Homograph { font-size: xx-small; } -2
# .itx_VariantTypes { font-variant: small-caps; }
# .itx_txt { }
# .itx_gls { }
# .itx_pos { }
# .itx_punct { }
# .itx_morphemes { } u,-k,-u
# .itx_morph { } a
# .itx_morph_txt { }
# .itx_morph_gls { }
# .itx_morph_cf { }: say, prs, lsg 
# .itx_morph_msa { }
# 
# .itx_Freeform { }
# .itx_Freeform_gls { }
# .itx_Freeform_lit { }
# .itx_Freeform_note { }
# results <- webpage %>% html_nodes(".itx_Frame_Number") # = each sentence but JUST THE FRAME NUMBER
# results <- webpage %>% html_nodes(".itx_txt") # = each word
# results <- webpage %>% html_nodes("p") # each sentence, with all nested
# results <- results[1] # reduce to only 1st frame for figuring out



# how to deal with that weird spacing -------------------------------------


# some notations
# test<-morphemes[1]
# sst <- as.data.frame(strsplit(test, "\n"))
# names(sst)<-"col1"
# sst<-str_trim(sst$col1) # can't use trimws because these spaces are actually
# # ascicode 160 nonbraking spaces
# # https://stackoverflow.com/questions/56782045/how-to-trim-white-spaces-when-trimws-is-not-working
# 
# 
