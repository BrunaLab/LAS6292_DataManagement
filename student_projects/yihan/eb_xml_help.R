# this is the outpt of software used in linguistics:
#   https://software.sil.org/fieldworks/

# the rows in each table of the html/xml file represent 
# 1) the words in a phrase
# 2) the individual components that make up each word (ranges 1-several)
# 3) second row of individual components, some with notations
# 4) the translation of each component
# 5) the grammatical type of each compoent (verb, noun, etc)
# 6) the translation of the word
# 7) the grammatical type of each word

# The issue (I think) is that there are cells in the html table that span 
# multiple columns, but only in some rows?  It's an issue of terribly organized
# htm xml output (I think)

library(tidyverse)


# XML file ----------------------------------------------------------------
library(XML)
library(xml2)
url <- "./student_projects/yihan/data.xml"

raw_data<-read_xml(url)
xml_name(raw_data)
xml_children(raw_data)

# raw_parsed <- xml_find_all(raw_data, ".//paragraph")
# raw_parsed
# unstack(data.frame(d<-unlist(x),names(d)))
# there are ~60 tables, so output of list of 63 makes sense 

xmldoc <- xmlParse(url)
rootNode <- xmlRoot(xmldoc)
df<-rootNode[1]
df2<-df[1]

# df2<-df[2][[1]]
df
df <- xmlSApply(df,function(x) xmlSApply(x, xmlValue))
data.as.df <- data.frame(t(df),row.names=NULL)
data.as.df$paragraphs
#appears all is dumped into one cell of df?


# HTM File ----------------------------------------------------------------
library(rvest)
url <- "./student_projects/yihan/data.html"

webpage <- read_html(url)
webpage


# .itx_Words { }
# .itx_Frame_Number { }
# .itx_Frame_Word { margin: 10px 5px 10px 5px; }
# .itx_Homograph { font-size: xx-small; }
# .itx_VariantTypes { font-variant: small-caps; }
# .itx_txt { }
# .itx_gls { }
# .itx_pos { }
# .itx_punct { }
# .itx_morphemes { }
# .itx_morph { }
# .itx_morph_txt { }
# .itx_morph_gls { }
# .itx_morph_cf { }
# .itx_morph_msa { }
# 
# .itx_Freeform { }
# .itx_Freeform_gls { }
# .itx_Freeform_lit { }
# .itx_Freeform_note { }
results <- webpage %>% html_nodes(".itx_Frame_Number")
results <- webpage %>% html_nodes(".itx_txt")
results <- webpage %>% html_nodes("p")






if (utils::packageVersion("xml2") > "0.1.2") {
  results %>% html_node("span")
}
results <- webpage %>% html_nodes(".itx_txt") %>% html_nodes(".itx_morphemes")


# foo<-results[[1]]
# http://www.cse.chalmers.se/~chrdimi/downloads/web/getting_web_data_r4_parsing_xml_html.pdf
# results <- webpage %>% html_nodes("span")

doc2 = xmlParse("webpage",isHTML = T)
results <- webpage %>% html_nodes("p")
library(magrittr)
results<-webpage %>% 
  html_nodes(".itx_Words") %>% 
  extract2(1)

# movies_xml = xmlParse(results, asText = TRUE)




df<-webpage %>% 
  html_nodes(".itx_Words") %>% 
  extract2(1) %>% 
  html_nodes(".itx_Frame_Word") %>% 
  extract2(1) %>% 
  html_nodes(".itx_txt")

records <- vector("list", length = length(results))
i=1
for (i in seq_along(results)) {
  words <- results[i] %>% html_text(trim = TRUE)
  # lie <- str_sub(xml_contents(results[i])[2] %>% html_text(trim = TRUE), 2, -2)
  # explanation <- str_sub(results[i] %>% html_nodes(".short-truth") %>% html_text(trim = TRUE), 2, -2)
  # url <- results[i] %>% html_nodes("a") %>% html_attr("href")
  records[[i]] <- tibble(words = words)
  # records[[i]] <- data_frame(date = date, lie = lie, explanation = explanation, url = url)
}

df <- bind_rows(records)
df


results <- webpage %>% html_nodes(".itx_gls")
results <- webpage %>% html_nodes(".itx_morphemes")
results <- webpage %>% html_nodes(".itx_morphemes")
results <- webpage %>% html_nodes(".itx_morph")
results <- webpage %>% html_nodes(".itx_morph_txt")
results <- webpage %>% html_nodes(".itx_morph_cf")%>% html_nodes(".itx_Homograph")
results <- webpage %>% html_nodes(".itx_Homograph")

results <- webpage %>% html_nodes(".itx_txt") 
results <- webpage %>% html_nodes(".itx_morphemes") 

results <- webpage %>% html_nodes(".itx_txt") 
records <- vector("list", length = length(results))
for (i in seq_along(results)) {
  words <- results[i] %>% html_text(trim = TRUE)
  # explanation <- str_sub(results[i] %>% html_nodes(".short-truth") %>% html_text(trim = TRUE), 2, -2)
  # lie <- str_sub(xml_contents(results[i])[2] %>% html_text(trim = TRUE), 2, -2)
  # url <- results[i] %>% html_nodes("a") %>% html_attr("href")
  records[[i]] <- tibble(words = words)
  # records[[i]] <- data_frame(date = date, lie = lie, explanation = explanation, url = url)
}

df <- bind_rows(records)
df
glimpse(df)



words<-xml_contents(words)
xml_contents(words)[2] %>% html_text(trim = TRUE)
xml_contents(results)
results[2][1]

# all of the p nodes
results <- webpage %>% html_nodes("p") %>% html_text
results <- webpage %>% html_nodes("span") %>% html_text
results <- webpage %>% html_nodes("td") %>% html_text
results <- webpage %>% html_nodes(   ) %>% html_text
itx_morphemes
# Attempt to get the first 'table'
first_result <- results[1] # No 1
first_result <- results[2] # `column` 1
first_result <- results[3] # column 1 cells 2:5
first_result <- results[4] # column2
first_result <- results[5] # column 2 cells 2:5
first_result <- results[6] # column 3 (which and all sub-cells)
first_result <- results[7] # column 3 (cells 2:5) - can use this to figurte out 
# how to make the breaks in the previous one
first_result <- results[8] # column 3 (cells 2:5) - can use this to figurte out 
first_result <- results[9] # column 3 (cells 2:5) - can use this to figurte out 
first_result <- results[10] # column 3 (cells 2:5) - can use this to figurte out 
first_result <- results[11] # column 3 (cells 2:5) - can use this to figurte out 

first_result <- results[[3]]
first_result
# This will get me the output of the first table, 
# but not sure how to get in proper order
#TODO: gsub \n\n witha comma and see how that structures
first.result.table <-read.table(text=gsub("(?<=[a-z])\\s+", "\n",
                                          results, perl=TRUE),
                                header=FALSE)

first.result.table



sections <- html_nodes(webpage, ".itx_txt > .itx_morphemes ~ .itx_morphemes")
sections <- html_nodes(webpage, "lang > class ~ class")
for (section in sections) {
  paras <- html_nodes(section, "p")
  # Do stuff with paragraphs in each section...
  
  print(length(paras))
}
# [1] 9
# [1] 8