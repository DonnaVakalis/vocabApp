#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


#------------------
# Load libraries
#------------------

require(mosaic)
library(Rcurl)
library(googlesheets)
library(shiny)

#------------------
# Load words
#------------------ 

#gs_auth(new_user = TRUE)
dat.words <-
    fetchgoogle("https://docs.google.com/spreadsheets/d/e/2PACX-1vTxGsugPOVT3A5339ZiHK46q6FATBU1gRQlwyUp5Z3R17iK5zFgCV09Cm5JtvA0HgyH7CIjrCPEFngm/pub?gid=0&single=true&output=csv")  

dat.words<- fetchdata("https://drive.google.com/uc?export=download&id=e")
    

#------------------
# UI for application that shows a french word
#------------------
ui<-
    pageWithSidebar(
    headerPanel("actionButton test"),
    sidebarPanel(
       #numericInput("n", "N:", min = 0, max = 100, value = 50),
        #br(),
        actionButton("goButton", "Go!"),
        p("Click the button to update the French word displayed in the main panel.")
    ),
    mainPanel(
        verbatimTextOutput("nText")
  )
)


#------------------
# Server Logic that shows a french word
#------------------
server<-
    function(input, output) {
  
    # builds a reactive expression that only invalidates 
    # when the value of input$goButton becomes out of date 
    # (i.e., when the button is pressed)
    ntext <- eventReactive(input$goButton, {
       #input$n
        #fetch a word from the file
        
        "Test"
  })
  
    output$nText <- renderText({
        ntext()
  })
}




# Run the application 
shinyApp(ui = ui, server = server)

