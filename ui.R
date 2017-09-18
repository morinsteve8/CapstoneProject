#
#   File: ui.R
#
#   Data Science Specialization
#   Capstone Project
#
#
#

suppressPackageStartupMessages(c(library(tm),
                                 library(stringr),
                                 library(shinythemes),
                                 library(markdown),
                                 library(shiny),
                                 library(stylo)))

shinyUI(
  navbarPage(
    "Capstone Project for Data Science Specialization",
    
    tabPanel("Text Prediction",
               fluidRow(
               column(4),
               column(
                 5,
                 tags$div(
                   textInput(
                     "text",
                     label = h4("Enter text:"),
                     value =
                   ),
                   tags$span( ("Language: English")),
                   br(),
                   br(),
                   br(),                   
                   tags$hr(),
                   h4("Predicted next word:"),
                   tags$span(style = "color:green",
                             tags$strong(tags$h2(
                               textOutput("predWord")
                             ))),
                   br(),
                   br(),
                   br(),                   
                   tags$hr(),
                   h4("Text entered:"),
                   tags$em(tags$h4(textOutput("txtEntered"))),
                   align = "center"
                 )
               ),
               column(4)
             ))
  )
)