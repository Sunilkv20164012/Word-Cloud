
#info__
api_Key <- 'EyripEqtcshDyaTHmg4vwm0X7'
api_secret <- 'jaDcVoyJsqGANf61njFCHVxe4iE88xNRTP6Tjyuu0O8hSbRnF3'
access_token <- '1195363105498226690-hcdlZjqMv4WGoPZtmEsOqaUCKsh4oj'
access_token_secret <- 's4spVNfqXqb4qrUIqtrKDcGHlAUPNKZyv5fZaPBJWJQOC'

#twitter library
library(twitteR)
setup_twitter_oauth(api_Key,api_secret,access_token, access_token_secret)
#getting_tweets

tweets <- searchTwitter('Ayodhya+Verdict',n=555,lang = 'en')
tweets
tweetsdf <- twListToDF(tweets)
write.csv(tweetsdf,file = 'file:///C:/Users/Anshu JaB/Desktop/ALL IN/7TH SEM/OE_Project/data_twitter_A_V.csv')
