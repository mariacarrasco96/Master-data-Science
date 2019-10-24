library(shiny)

shinyServer(function(input,  output){
  
  output$miOutputFavorito <- renderPlot({
    paste0("El usuario ha introducido: ", input$nbins)
    hist(faithful$eruptions, breaks = input$nbins)
  
  } )
  
  
  
  
})









