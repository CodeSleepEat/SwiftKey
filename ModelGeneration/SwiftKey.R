library(tm)
library(stringi)
library(ngram)
library(stringr)

twitter_con <- file("C:/Users/maier/Desktop/Datensätze/en_US.twitter.txt", "r")
twitter <- readLines(twitter_con, skipNul = T)
close(twitter_con)

blogs_con <- file("C:/Users/maier/Desktop/Datensätze/en_US.blogs.txt", "r")
blogs <- readLines(blogs_con, skipNul = T)
close(blogs_con)

news_con <- file("C:/Users/maier/Desktop/Datensätze/en_US.news.txt", "r")
news <- readLines(news_con, skipNul = T)
close(news_con)


twitter_sample <- sample(twitter, length(twitter)*0.2)
blogs_sample <- sample(blogs, length(blogs)*0.2)
news_sample <- sample(news, length(news)*0.2)
dataset <- c(twitter_sample, blogs_sample, news_sample)
dataset <- tolower(dataset)
dataset <- removePunctuation(dataset)
dataset <- removeNumbers(dataset)
dataset <- stripWhitespace(dataset)


dataset_ngram <- dataset[sapply(dataset, wordcount) > 5]

ngram_1 <- ngram(dataset_ngram, n = 1)
ngram_1_table <- get.phrasetable(ngram_1)
ngram_1_table <- ngram_1_table[1:100, 1]
ngram_1_table <- stripWhitespace(ngram_1_table)
ngram_1_table <- gsub(" ", "", ngram_1_table)
saveRDS(ngram_1_table, "ngram_1_2_table.RData")

ngram_2 <- ngram(dataset_ngram, n = 2)
ngram_2_table <- get.phrasetable(ngram_2)
ngram_2_table <- unlist(strsplit(ngram_2_table[[1]], " "))
ngram_2_table <- as.data.frame(matrix(ngram_2_table, ncol = 2, byrow = T))
saveRDS(ngram_2_table, "ngram_2_2_table.RData")

ngram_3 <- ngram(dataset_ngram, n = 3)
ngram_3_table <- get.phrasetable(ngram_3)
ngram_3_table <- unlist(strsplit(ngram_3_table[[1]], " "))
ngram_3_table <- as.data.frame(matrix(ngram_3_table, ncol = 3, byrow = T))
saveRDS(ngram_3_table, "ngram_3_2_table.RData")

ngram_4 <- ngram(dataset_ngram, n = 4)
ngram_4_table <- get.phrasetable(ngram_4)
ngram_4_table <- unlist(strsplit(ngram_4_table[[1]], " "))
ngram_4_table <- as.data.frame(matrix(ngram_4_table, ncol = 4, byrow = T))
saveRDS(ngram_4_table, "ngram_4_2_table.RData")

ngram_5 <- ngram(dataset_ngram, n = 5)
ngram_5_table <- get.phrasetable(ngram_5)
ngram_5_table <- unlist(strsplit(ngram_5_table[[1]], " "))
ngram_5_table <- as.data.frame(matrix(ngram_5_table, ncol = 5, byrow = T))
saveRDS(ngram_5_table, "ngram_5_2_table.RData")
  




