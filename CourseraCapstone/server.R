#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyServer(function(input, output, session) {
  # focus inputfield
  session$sendCustomMessage("selectText", "#inputtext")
  
  # load models
  ngram_1 <- readRDS("./ngram_1_2_table.RData")
  ngram_2 <- readRDS("./ngram_2_2_table.RData")
  ngram_3 <- readRDS("./ngram_3_2_table.RData")
  ngram_4 <- readRDS("./ngram_4_2_table.RData")
  ngram_5 <- readRDS("./ngram_5_2_table.RData")
  
  # predict most popular words if no prediction is found
  prediction1 <- reactiveVal(ngram_1[1])
  prediction2 <- reactiveVal(ngram_1[2])
  prediction3 <- reactiveVal(ngram_1[3])
  prediction4 <- reactiveVal(ngram_1[4])
  prediction5 <- reactiveVal(ngram_1[5])

  
  observeEvent(input$inputtext, {
    # prepare input data
    text <- input$inputtext
    text <- tolower(text)
    words <- strsplit(text, " ")
    lengthinput <- length(words[[1]])
    
    
    # check predictions on last word
    if(lengthinput >= 1) {
      lastwords <- words[[1]][lengthinput]
      predictions <- head(ngram_2[ngram_2[1] == lastwords[1], 2], 5)
      
      
      if(length(predictions) > 0) {prediction1(predictions[1])}
      if(length(predictions) > 1) {prediction2(predictions[2])}
      if(length(predictions) > 2) {prediction3(predictions[3])}
      if(length(predictions) > 3) {prediction4(predictions[4])}
      if(length(predictions) > 4) {prediction5(predictions[5])}
    } 
    
    # check predictions on last two words
    if(lengthinput >= 2) {
      lastwords <- words[[1]][(lengthinput-1):lengthinput]
      predictions <- head(ngram_3[ngram_3[1] == lastwords[1] &
                                    ngram_3[2] == lastwords[2], 3], 5)
      
      
      if(length(predictions) > 0) {prediction1(predictions[1])}
      if(length(predictions) > 1) {prediction2(predictions[2])}
      if(length(predictions) > 2) {prediction3(predictions[3])}
      if(length(predictions) > 3) {prediction4(predictions[4])}
      if(length(predictions) > 4) {prediction5(predictions[5])}
    } 
    
    # check predictions on last three words
    if(lengthinput >= 3) {
      lastwords <- words[[1]][(lengthinput-2):lengthinput]
      predictions <- head(ngram_4[ngram_4[1] == lastwords[1] &
                                    ngram_4[2] == lastwords[2] & 
                                    ngram_4[3] == lastwords[3], 4], 5)
      
      
      if(length(predictions) > 0) {prediction1(predictions[1])}
      if(length(predictions) > 1) {prediction2(predictions[2])}
      if(length(predictions) > 2) {prediction3(predictions[3])}
      if(length(predictions) > 3) {prediction4(predictions[4])}
      if(length(predictions) > 4) {prediction5(predictions[5])}
    } 
    
    # check predictions on last four words
    if(lengthinput >= 4) {
      lastwords <- words[[1]][(lengthinput-3):lengthinput]
      predictions <- head(ngram_5[ngram_5[1] == lastwords[1] &
                                    ngram_5[2] == lastwords[2] &
                                    ngram_5[3] == lastwords[3] &
                                    ngram_5[4] == lastwords[4], 5], 5)
      
    
      if(length(predictions) > 0) {prediction1(predictions[1])}
      if(length(predictions) > 1) {prediction2(predictions[2])}
      if(length(predictions) > 2) {prediction3(predictions[3])}
      if(length(predictions) > 3) {prediction4(predictions[4])}
      if(length(predictions) > 4) {prediction5(predictions[5])}
    } 
    
    
    updateActionButton(session, "recommendation1",
                       label = prediction1())
    updateActionButton(session, "recommendation2",
                       label = prediction2())
    updateActionButton(session, "recommendation3",
                       label = prediction3())
    updateActionButton(session, "recommendation4",
                       label = prediction4())
    updateActionButton(session, "recommendation5",
                       label = prediction5())
  }, ignoreInit = TRUE)
  
  
  # write text in inputfield if button is pressed
  observeEvent(input$recommendation1, {
    updateTextAreaInput(session, "inputtext", 
                        value = paste0(input$inputtext, 
                                       ifelse(substr(input$inputtext,
                                                     nchar(input$inputtext),
                                                     nchar(input$inputtext)) == " ", "", " "),
                                       prediction1()))
    # refocus inputfield
    session$sendCustomMessage("selectText", "#inputtext")

  }, ignoreInit = TRUE)
  
  # write text in inputfield if button is pressed
  observeEvent(input$recommendation2, {
    updateTextAreaInput(session, "inputtext", 
                        value = paste0(input$inputtext, 
                                       ifelse(substr(input$inputtext,
                                                     nchar(input$inputtext),
                                                     nchar(input$inputtext)) == " ", "", " "),
                                       prediction2()))
    # refocus inputfield
    session$sendCustomMessage("selectText", "#inputtext")
    
  }, ignoreInit = TRUE)
  
  # write text in inputfield if button is pressed
  observeEvent(input$recommendation3, {
    updateTextAreaInput(session, "inputtext", 
                        value = paste0(input$inputtext, 
                                       ifelse(substr(input$inputtext,
                                                     nchar(input$inputtext),
                                                     nchar(input$inputtext)) == " ", "", " "),
                                       prediction3()))
    # refocus inputfield
    session$sendCustomMessage("selectText", "#inputtext")
    
  }, ignoreInit = TRUE)
  
  # write text in inputfield if button is pressed
  observeEvent(input$recommendation4, {
    updateTextAreaInput(session, "inputtext", 
                        value = paste0(input$inputtext, 
                                       ifelse(substr(input$inputtext,
                                                     nchar(input$inputtext),
                                                     nchar(input$inputtext)) == " ", "", " "),
                                       prediction4()))
    # refocus inputfield
    session$sendCustomMessage("selectText", "#inputtext")
    
  }, ignoreInit = TRUE)
  
  # write text in inputfield if button is pressed
  observeEvent(input$recommendation5, {
    updateTextAreaInput(session, "inputtext", 
                        value = paste0(input$inputtext, 
                                       ifelse(substr(input$inputtext,
                                                     nchar(input$inputtext),
                                                     nchar(input$inputtext)) == " ", "", " "),
                                       prediction5()))
    # refocus inputfield
    session$sendCustomMessage("selectText", "#inputtext")
    
  }, ignoreInit = TRUE)
  
})
