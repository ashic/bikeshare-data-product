library(shiny)
library(stats)


input <- read.csv('train.csv', 
                  colClasses = c('character', rep('integer', 4), 
                  rep('numeric', 4), rep('integer', 3)))
input$hour <- as.integer(substr(input$datetime, 12, 13))
input <- input[, -1]
input <- input[, c(12, 1:11)]
set.seed(1143)
input <- input[, -c(6, 10, 11)]

fit <- glm(count ~ ., data=input)

sourceCode <- readLines('server.R')


shinyServer(function(input, output) {
    output$count <- renderText({
        testData <- data.frame(hour=input$hour, 
            season=as.integer(as.character(input$season)),
            holiday=as.integer(input$holiday), 
            workingday = as.integer(input$workingday),
            weather=as.integer(as.character(input$weather)), 
            atemp=input$atemp, humidity=input$humidity, 
            windspeed=input$windspeed)
        p <- predict(fit, testData)
        if(p < 0) 0 else round(p)
    })
    
    output$sourceCode <- renderText({
        paste(sourceCode, collapse='<br />')})
    
    output$modelSummary <- renderPrint({fit})
})
