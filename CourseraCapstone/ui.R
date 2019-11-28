#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  tags$head(
    tags$script("
      Shiny.addCustomMessageHandler('selectText', function(field) {
        $(field).select();
      });
    "),
    tags$style(HTML("
                    .col-sm-4 {
                      margin-top: 20px;
                    }
                    button {
                      width: 15%;
                    }
                    
                    "))
    ),
  
  # Application title
  titlePanel("Data Science Capstone Project - SwiftKey"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      "Data Science Courser Capstone Project - Next Word Prediction"
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Type your input in the box below:"),
      textAreaInput("inputtext", NULL, width = "150%"),
      actionButton("recommendation1", "the"),
      actionButton("recommendation2", "to"),
      actionButton("recommendation3", "and"),
      actionButton("recommendation4", "a"),
      actionButton("recommendation5", "of")
    )
  )
))
