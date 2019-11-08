library(shiny)
library(tidyverse)
data('mpg')
data('mtcars')
data('cars')
data('anscombe')
data('trees')
data('Titanic')

ui <- fluidPage(
      titlePanel("Práctica reactividad"),
      sidebarLayout(
        sidebarPanel(
          selectInput("datos", 
                      label = "Elige datos:",
                      choices = list(
                              "Gasolina" = "mpg",
                              "Motor" = "mtcars",
                              "Coches" = "cars",
                              "Regresión lineal" = "anscombe",
                              "Cerezos negros" = "trees",
                              "Supervivientes del Titanic" = "Titanic"),
                      selected = "mpg"),
            selectInput("resultado", 
                      label = "Resultado:",
                      choices = list("Mostrar summary" = "summary",
                              "Mostrar primeras filas" = "head",
                              "Mostrar últimas filas" = "tail"),
                      selected = "summary"),
          actionButton("button_resultado",
                       label = "Mostrar resultado"),
          ),
        
        mainPanel(
          verbatimTextOutput("Ver_Resultado"),
            )
          )
        )
  
    
server <- function(input,output){
    output$Ver_Resultado <- renderPrint({
      input$button_resultado
      
    baseDatos <- isolate(input$datos)
    seleccionResumen <- isolate(input$resultado)
      
    seleccionBaseDatos <- switch(baseDatos,
                                 "Gasolina" = mpg,
                                 "Motor" = mtcars,
                                 "Coches" = cars,
                                 "Regresión lineal" = anscombe,
                                 "Cerezos negros" = trees,
                                 "Supervivientes del Titanic" = Titanic)
   
    elegirResumen <- ifelse(seleccionResumen == 'summary',
                            summary,
                            ifelse(seleccionResumen == 'head',
                                   head, tail))
    
    
    elegirResumen(seleccionBaseDatos)  
      
    })
}


shinyApp(ui = ui, server = server)
