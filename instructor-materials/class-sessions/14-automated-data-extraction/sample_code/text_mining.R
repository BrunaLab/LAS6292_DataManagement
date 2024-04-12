
# text mining resources ---------------------------------------------------

# * [Text Mining with R](https://www.tidytextmining.com/) by Julia Silge and David Robinson
# * [`gutenbergr`](https://cran.r-project.org/web/packages/gutenbergr/index.html): Download and Process Public Domain Works from [Project Gutenberg](https://www.gutenberg.org/). Tutorial can be found [here](https://docs.ropensci.org/gutenbergr/)

# install or load the libraries -------------------------------------------
library(tidyverse)

# organizing and analyzing the text files
library(tidytext)

# downloading books from Project Gutenberg
# install.packages("gutenbergr")
library(gutenbergr)

# ID stopwords
# install.packages("stopwords")
library(stopwords)

# To create wordclouds of the results
# install.packages("reshape2")
# install.packages("wordcloud")
library(reshape2)
library(wordcloud)

# tools for working with Jane Austen's books  
# install.packages("janeaustenr")
library(janeaustenr)

# tools for working with strings 
# install.packages("stringr")
library(stringr)

# list of books -----------------------------------------------------------
# all the books in Project Gutenberg
gm<-gutenberg_metadata
gm

# download the book you want ----------------------------------------------

# Comment out the one you want to analyze

# # Development of the Digestive Canal of the American Alligator by A. M. Reese
# gator_guts<-gutenberg_download(22327)
# lw<-gator_guts
# lw$line <- seq(1:nrow(lw))
# 
# # Psychology and Achievement, by Warren Hilton
# psych1 <- gutenberg_download(13791)
# lw<-psych1
# 
# # Memoirs of Extraordinary Popular Delusions and the Madness of Crowds by Mackay
# psych2 <- gutenberg_download(24518)
# lw<-psych2
# 
# # Antarctic Penguins, by George Murray Levick
# lw<-gutenberg_download(36922)

# Little Women by Louisa May Alcott
lw <- gutenberg_download(514)
lw$line <- seq(1:nrow(lw))


# text analysis -----------------------------------------------------------

# tokenize the text into words

words <- lw %>%
  unnest_tokens(word, text)

# remove the stopwords (a, and, the, etc)

# stopwords<-stopwords()
# > stopwords<-as.data.frame(stopwords)

words <- words %>% 
  anti_join(get_stopwords())
words

# Count the number of different words
word_counts <- words %>%
  anti_join(stop_words, by = "word") %>%
  count(word, word, sort = TRUE)
word_counts

# All three of these lexicons are based on unigrams, i.e., single words. These 
# lexicons contain many English words and the words are assigned scores for 
# positive/negative sentiment, and also possibly emotions like joy, anger, 
# sadness, and so forth. The nrc lexicon categorizes words in a binary fashion 
# (“yes”/“no”) into categories of positive, negative, anger, anticipation, 
# disgust, fear, joy, sadness, surprise, and trust. The bing lexicon categorizes
# words in a binary fashion into positive and negative categories. The AFINN 
# lexicon assigns words with a score that runs between -5 and 5, with negative 
# scores indicating negative sentiment and positive scores 
# indicating positive sentiment.

# These are the word sentiment libraries. They need to be downloaded, 
# and can be quite large.

get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc") # Bigger file

# examples of word under different sentiment categories
nrc_joy <- get_sentiments("nrc") %>% 
  filter(sentiment == "joy")

bing_positive <- get_sentiments("bing") %>% 
  filter(sentiment == "positive")

bing_negative <- get_sentiments("bing") %>% 
  filter(sentiment == "negative")

#  word counts from your selected text in different categories
joy_words <- word_counts %>% 
  inner_join(nrc_joy) %>%
  arrange(desc(n))
joy_words

positive_words <- word_counts %>% 
  inner_join(bing_positive) %>%
  arrange(desc(n))
positive_words

negative_words <- word_counts %>% 
  inner_join(bing_negative) %>%
  arrange(desc(n))
negative_words

positive_words <- word_counts %>% 
  inner_join(bing_positive) %>%
  arrange(desc(n))
positive_words


# visualize the results ---------------------------------------------------

# wordcloud 
lw_sentiment <- words %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("gray20", "gray80"),
                   max.words = 75)


# sentiment over the course of one text
lw_sentiment <- words %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, index = line, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative) %>% 
  arrange(index)

ggplot(lw_sentiment, aes(index, sentiment, fill = sentiment)) +
  geom_col(show.legend = FALSE)

# sentiment analysis of Jane Austen's books over time

# plotting sentiment analysis of multiple books  --------------------------


tidy_books <- austen_books() %>%
  group_by(book) %>%
  mutate(
    linenumber = row_number(),
    chapter = cumsum(str_detect(text, 
                                regex("^chapter [\\divxlc]", 
                                      ignore_case = TRUE)))) %>%
  ungroup() %>%
  unnest_tokens(word, text)

jane_austen_sentiment <- tidy_books %>%
  inner_join(get_sentiments("bing")) %>%
  count(book, index = linenumber %/% 80, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)

ggplot(jane_austen_sentiment, aes(index, sentiment, fill = book)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~book, ncol = 2, scales = "free_x")
