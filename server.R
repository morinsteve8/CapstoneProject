#
#   File: server.R
#
#   Data Science Specialization
#   Capstone Project
#
#
#

suppressPackageStartupMessages(c(library(shinythemes),
                                 library(shiny),
                                 library(tm),
                                 library(stringr),
                                 library(markdown),
                                 library(stylo)))

# Read in pre-processed files
quadGramFile <- readRDS(file = "./files/quadGram.RData")
triGramFile <- readRDS(file = "./files/triGram.RData")
biGramFile <- readRDS(file = "./files/biGram.RData")

# Clean input as text is entered
transformInput <- function(text) {
  tempTxt <- tolower(text)
  tempTxt <- removeNumbers(tempTxt)
  tempTxt <- removePunctuation(tempTxt)
  tempTxt <- str_replace_all(tempTxt, "[^[:alnum:]]", " ")
  tempTxt <- stripWhitespace(tempTxt)
  
  tempTxt <- txt.to.words.ext(tempTxt,
                                 language = "English.all",
                                 preserve.case = TRUE)
  
  return(tempTxt)
}

# Funtion to predict next word
predWord <- function(numWords, textInput) {
  if (numWords >= 3) {
    textInput <- textInput[(numWords - 2):numWords]
  }
  else if (numWords == 2) {
    textInput <- c(NA, textInput)
  }
  else {
    textInput <- c(NA, NA, textInput)
  }
  
  wPred <-
    as.character(quadGramFile[quadGramFile$unigram == textInput[1] &
                              quadGramFile$bigram  == textInput[2] &
                              quadGramFile$trigram == textInput[3], ][1, ]$quadgram)
  
  if (is.na(wPred)) {
    wPred <-
      as.character(triGramFile[triGramFile$unigram == textInput[2] &
                                triGramFile$bigram == textInput[3], ][1, ]$trigram)
    
    if (is.na(wPred)) {
      wPred <-
        as.character(biGramFile[biGramFile$unigram == textInput[3], ][1, ]$bigram)
    }
  }
  print(wPred)

}

shinyServer(function(input, output) {
  wordPrediction <- reactive({
    text <- input$text
    textInput <- transformInput(text)
    numWords <- length(textInput)
    wordPrediction <- predWord(numWords, textInput)
  })
  output$predWord <- renderPrint(wordPrediction())
  output$txtEntered <-
    renderText({
      input$text
    }, quoted = FALSE)
})
