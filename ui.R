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
               column(2, h4("Enter text:"),                   
                      br(),
                      br(),
                      br(),
                      br(),                    
                      h4("Predicted next word:"),
                      br(),
                      br(),
                      br(),
                      br(),  
                      h4("Text entered:")
                      ),
               column(
                 5,
                 tags$div(
                   textInput(
                     "text",
                     label = h4(""), value =
                   ),
                   br(),
                   br(),
                   br(),                   
                   tags$span(style = "color:green",
                             textOutput("predWord")
                             ),
                   br(),
                   br(),
                   br(),                   
                   br(),
                   tags$em(tags$h4(textOutput("txtEntered"))),
                   align = "left"
                 )
               ),
               column(4

                      )
             ))
  )
)