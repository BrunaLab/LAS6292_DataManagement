

# sentiment analysis ------------------------------------------------------
library(tidyverse)
library(tidytext)
library(janeaustenr)
library(stringr)


get_sentiments("nrc")


tidy_books <- austen_books() %>%
  group_by(book) %>%
  mutate(
    linenumber = row_number(),
    chapter = cumsum(str_detect(text, 
                                regex("^chapter [\\divxlc]", 
                                      ignore_case = TRUE)))) %>%
  ungroup() %>%
  unnest_tokens(word, text)



nrc_joy <- get_sentiments("nrc") %>% 
  filter(sentiment == "joy")

emma <- tidy_books %>%
  filter(book == "Emma") %>%
  inner_join(nrc_joy) %>%
  count(word, sort = TRUE)


# Most common positive and negative words
# One advantage of having the data frame with both sentiment and word is that we
# can analyze word counts that contribute to each sentiment. By implementing 
# count() here with arguments of both word and sentiment, 
# we find out how much each word contributed to each sentiment.

bing_word_counts <- tidy_books %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()

bing_word_counts


bing_word_counts %>%
  filter(sentiment=="positive") %>% 
  slice_max(n, n = 10) %>% 
  ggplot(aes(n, word, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(x = "Contribution to sentiment",
       y = NULL)






bing_word_counts %>%
  filter(sentiment=="positive") %>% 
  slice_max(n, n = 10) %>% 
  ggplot(aes(n, word, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(x = "Contribution to sentiment",
       y = NULL)
bing_word_counts %>%
  group_by(sentiment) %>%
  slice_max(n, n = 10) %>% 
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n, word, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(x = "Contribution to sentiment",
       y = NULL)



bing_word_counts %>%
  group_by(sentiment) %>%
  slice_max(n, n = 10) %>% 
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n, word, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(x = "Contribution to sentiment",
       y = NULL)


# 
# Small sections of text may not have enough words in them to get a good estimate 
# of sentiment while really large sections can wash out narrative structure. 
# For these books, using 80 lines works well, but this can vary depending on 
# individual texts, how long the lines were to start with, etc. 
# We then use pivot_wider() so that we have negative and positive sentiment in
# separate columns, and lastly calculate a net sentiment (positive - negative).


library(tidyr)

emma_sentiment <- tidy_books %>%
  inner_join(get_sentiments("nrc")) %>%
  count(book, index = linenumber %/% 80, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)


jane_austen_sentiment <- tidy_books %>%
  inner_join(get_sentiments("nrc")) %>%
  count(book, index = linenumber %/% 80, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)













# 
# 
# Now we can plot these sentiment scores across the plot trajectory of each novel. 
# Notice that we are plotting against the index 
# on the x-axis that keeps track of narrative time in sections of text.

library(ggplot2)


ggplot(emma_sentiment, aes(index, sentiment)) +
  geom_col(show.legend = FALSE) 


ggplot(jane_austen_sentiment, aes(index, sentiment, fill = book)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~book, ncol = 2, scales = "free_x")