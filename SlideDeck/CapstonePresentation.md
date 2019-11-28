SwiftKey - Next Word Prediction
========================================================
author: CodeSleepEat
date: 
autosize: true

Instructions - Coursera Capstone Project
========================================================


The goal of this exercise is to create a product to highlight the prediction algorithm that you have built and to provide an interface that can be accessed by others. 

For this project you must submit:

A Shiny app that takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.

A slide deck consisting of no more than 5 slides created with R Studio Presenter (https://support.rstudio.com/hc/en-us/articles/200486468-Authoring-R-Presentations) pitching your algorithm and app as if you were presenting to your boss or an investor.

Method
========================================================

- The prediction algorithm used for the Shiny App works with N-Grams to predict the next words
- It is based on a subset of the given twitter, news and blog data
- N-Grams for 1 up tp 5 words where generated (Code can be found in github repository) and saved as RData with the saveRDS function --> The model will not be recalculated frequently and it would not be suitable to calculate the modell once the user opened the app
- The app loads the saved models and uses them to make predictions

Prediction Algorithm
========================================================

- The algorithm wants to make 5 suggestions for the next word
- It starts by using the most common 5 words from the training data as predictions/ recommendations
- Then it checks if there is one word typed inside the inputfield and whether there are predictions from the 2-Word-N-Gram for the given word
- And So On... Until 5-Word-N-Gram
- If the algorithm finds predictions from higher N-Grams it overwrites the old predictions
- If no prediction is found the most common words will be displayed as the suggestions


Shiny Web App
========================================================
- The Shiny App has a Input-Text-Field for the input data and 5 buttons for the next word recommendations
- When the user types text into the input field the recommendations get automatically updated
- When the user clicks a button the recommendation is added to the input data (with a space if there isn't one)
- After clicking a button the inpt field is refocused so the user can continue to type without having to click on the input field again


Links and Sources
========================================================

- The App can be found here: https://codesleepeat.shinyapps.io/CourseraCapstone/

- The Code can be found here: https://github.com/CodeSleepEat/SwiftKey

- The Presentation can be found here: http://rpubs.com/CodeSleepEat/554533
