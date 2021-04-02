https://utstat.toronto.edu/~nathan/teaching/sta4002/Class1/scrapingtwitterinR-NT.html
https://rpubs.com/Kyleen1991/594933

https://www.infoworld.com/article/3515712/how-to-search-twitter-with-rtweet-and-r.html

http://geoffjentry.hexdump.org/twitteR.pdf



library(tidyverse)
library(tidytext)
library(twitteR)


library(twitteR)

consumer_key <- '5UUsXTN7GNX0WoXx0J6HkImGw'
consumer_secret <- 't3wjWQcw7Ea5HDdNgvNxzv97o00IUXEPJCajbgy0OzYUDnJqDj'
access_token <- '19717244-oO2jv3WzAjP5aDfChmmU651iA5eZ6flJ0bUTVhtDg'
access_secret <- 'YuSpGsCcejyG9crGtstkPaGa1z7Q3A2LM2CjxJmE1IYlm'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


fn_twitter <- searchTwitter("@UF",n=1000,lang="en")

fn_twitter_df <- twListToDF(fn_twitter) # Convert to data frame


tweet_words <- fn_twitter_df %>% select(id, text) %>% unnest_tokens(word,text)

tweet_words %>% count(word,sort=T) %>% slice(1:20) %>% 
  ggplot(aes(x = reorder(word, 
                         n, function(n) -n), y = n)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 60, 
                                                                                                                      hjust = 1)) + xlab("")


# Create a list of stop words: a list of words that are not worth including

my_stop_words <- stop_words %>% select(-lexicon) %>% 
  bind_rows(data.frame(word = c("https", "t.co", "rt", "amp","78","fakenews")))

tweet_words_interesting <- tweet_words %>% anti_join(my_stop_words)

tweet_words_interesting %>% group_by(word) %>% tally(sort=TRUE) %>% slice(1:25) %>% ggplot(aes(x = reorder(word, 
                                                                                                           n, function(n) -n), y = n)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 60, 
                                                                                                                                                                                                        hjust = 1)) + xlab("")

bing_lex <- get_sentiments("nrc")
fn_sentiment <- tweet_words_interesting %>% left_join(bing_lex)
fn_sentiment %>% filter(!is.na(sentiment)) %>% group_by(sentiment) %>% summarise(n=n())


crantastic <- getUser('PresidentFuchs')