library(shiny)

shinyUI(fluidPage(
  
  titlePanel("How Many Runs Must the Detroit Tigers Score to Win?"),
  
  # Sidebar with a numeric input for number of runs 
  sidebarLayout(
    sidebarPanel(
        h3("How many runs have the Tigers scored?"),
        numericInput("numeric", "RUNS", 0, 0, 100000000000, 1 ),
        submitButton("Score This!")
    ),
    
    mainPanel(
       h3("Projected Outcome:"),
       textOutput("text1"),
       h5("1 = Loss"),
       h5("2 = Win")
    )
  )
))
