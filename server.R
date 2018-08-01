library(shiny)

shinyServer(function(input, output) {
   
        runs_for <- c(10, 0, 6,6,0,9,6,1,0,1,1,3,6,4,6,13,3,2,12,5,13,3,0,
                      0,9,3,2,2,3,6,2,3,2,6,7,4,4,5,5,6,9,0,3,4,2,2,2,0,4,
                      5,4,3,9,2,6,6,5,7,4,4,4,0,1,7,1,4,2,4,5,3)
        win_loss <- as.factor(c("L", "L", "L", "W", "L", "W", "W", "W", "L", "L", "L", "L", "L", "W", "W", "W", "W", "L",
                      "W", "L", "W", "L", "L", "L", "W", "L", "L", "W", "W", "L", "L", "W", "L", "L", "W", "L",
                      "W", "L", "W", "W", "W", "L", "W", "L", "L", "L", "L", "L", "W", "W", "L", "W", "W", "L",
                      "W", "W", "W", "W", "L", "L", "W", "L", "L", "W", "L", "W", "L", "L", "W", "W"))
        season <- data.frame(Runs_For = runs_for, W_L = win_loss)
        gbm_Tigers <- train(W_L ~ Runs_For, data = season, method = "gbm", 
                            trControl=trainControl(), verbose = FALSE)
        model_predict <- reactive({
                runs_input <- input$numeric
                predict(gbm_Tigers, newdata = data.frame("Runs_For" 
                                = runs_input))})
        
  output$text1 <- renderText({
    
        model_predict()
  })
  
})
