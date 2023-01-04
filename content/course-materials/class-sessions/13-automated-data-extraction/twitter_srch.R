
# some useful tutorials for getting tweets with R -------------------------

# https://utstat.toronto.edu/~nathan/teaching/sta4002/Class1/scrapingtwitterinR-NT.html
# https://rpubs.com/Kyleen1991/594933
# https://www.infoworld.com/article/3515712/how-to-search-twitter-with-rtweet-and-r.html
# http://geoffjentry.hexdump.org/twitteR.pdf


# Load the libraries ------------------------------------------------------
install.packages('tidytext')
install.packages('twitteR')

library(tidyverse)
library(tidytext)
library(twitteR)

# load the keys and tokens to access twitter API --------------------------

consumer_key <- '5UUsXTN7GNX0WoXx0J6HkImGw'
consumer_secret <- 't3wjWQcw7Ea5HDdNgvNxzv97o00IUXEPJCajbgy0OzYUDnJqDj'
access_token <- '19717244-oO2jv3WzAjP5aDfChmmU651iA5eZ6flJ0bUTVhtDg'
access_secret <- 'YuSpGsCcejyG9crGtstkPaGa1z7Q3A2LM2CjxJmE1IYlm'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


# srch for a user
user1<-"@brunalab"
tweet_data1<-userTimeline(user = user1, n=3200)

# Search twitter for specific words or phrases
fn_twitter <- searchTwitter("our flag means death",n=1000,lang="en")
head(fn_twitter)
fn_twitter_df <- twListToDF(fn_twitter) # Convert to data frame
head(fn_twitter_df)

tweet_words <- fn_twitter_df %>% select(id, text) %>% unnest_tokens(word,text)
head(tweet_words,10)


# visualize the words -----------------------------------------------------

tweet_words %>% count(word,sort=T) %>% slice(1:20) %>% 
  ggplot(aes(x = reorder(word, 
                         n, function(n) -n), y = n)) + 
  geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 60,hjust = 1)) + xlab("")


# Create and exclude stopwords --------------------------------------------

# Create a list of stop words: a list of words that are not worth including

my_stop_words <- stop_words %>% select(-lexicon) %>% 
  bind_rows(data.frame(word = c("https", "t.co", "rt", "amp","78","fakenews", "the", "to", "a", "and", "in", "is","on")))

tweet_words_interesting <- tweet_words %>% anti_join(my_stop_words)

tweet_words_interesting %>% 
  group_by(word) %>% 
  tally(sort=TRUE) %>% 
  slice(1:25) %>% 
  ggplot(aes(x = reorder(word, n, function(n) -n), y = n)) +
  geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 60,hjust = 1)) +
  xlab("")

# sentiment analysis ------------------------------------------------------

bing_lex <- get_sentiments("nrc")

fn_sentiment <- tweet_words_interesting %>% left_join(bing_lex)
head(fn_sentiment,25)

fn_sentiment %>% 
  filter(!is.na(sentiment)) %>% 
  group_by(sentiment) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n))


# crantastic <- getUser('brunalab')





install.packages('rtweet')
library(rtweet)
rt<-get_timeline(user=c("brunalab"), n=500)