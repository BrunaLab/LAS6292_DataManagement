# * [Text Mining with R](https://www.tidytextmining.com/) by Julia Silge and David Robinson
# * [`gutenbergr`](https://cran.r-project.org/web/packages/gutenbergr/index.html): Download and Process Public Domain Works from [Project Gutenberg](https://www.gutenberg.org/). Tutorial can be found [here](https://docs.ropensci.org/gutenbergr/)

install.packages("gutenbergr")
library(gutenbergr)

gutenberg_metadata

#Psychology_and_achivement
psych1 <- gutenberg_download(13791)

#Memoirs of Extraordinary Popular Delusions and the Madness of Crowds by Mackay
psych2 <- gutenberg_download(24518)
lw<-psych2

#littlewomen
lw <- gutenberg_download(514)
lw$line <- seq(1:nrow(lw))

library(tidytext)
library(tidyverse)

words <- lw %>%
  unnest_tokens(word, text)

install.packages("stopwords")
library(stopwords)
words <- words %>% 
  anti_join(get_stopwords())


word_counts <- words %>%
  anti_join(stop_words, by = "word") %>%
  count(word, word, sort = TRUE)


library(tidytext)
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
get_sentiments("afinn")
get_sentiments("bing")
get_sentiments("nrc") # Bigger file

nrc_joy <- get_sentiments("nrc") %>% 
  filter(sentiment == "joy")



bing_positive <- get_sentiments("bing") %>% 
  filter(sentiment == "positive")



bing_negative <- get_sentiments("bing") %>% 
  filter(sentiment == "negative")


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



install.packages("reshape2")
install.packages("wordcloud")
library(reshape2)
library(wordcloud)
lw_sentiment <- words %>%
inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("gray20", "gray80"),
                   max.words = 100)







lw_sentiment <- words %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, index = line, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative) %>% 
  arrange(index)


library(ggplot2)

ggplot(lw_sentiment, aes(index, sentiment, fill = sentiment)) +
  geom_col(show.legend = FALSE)
