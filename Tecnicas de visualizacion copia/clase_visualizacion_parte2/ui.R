library(shiny)
library(ggplot2)
   

shinyUI(
  fluidPage(
    titlePanel("50 euros hora"),
    sidebarLayout(
      sidebarPanel(
        selectInput("variablex", label = h2("Elige la variable x"), 
                    choices = list("tamaño motor, en litros" = "displ","highway miles per gallon"="hwy",
                                  "city miles per gallon"= "cty","cylinders"= "cyl"),
                    selected = "displ"),
        selectInput("variabley", label = h2("Elige la variable y"), 
                    choices = list("tamaño motor, en litros" = "displ","highway miles per gallon"="hwy",
                                   "city miles per gallon"= "cty","cylinders"= "cyl"),
                    selected = "displ")
       
      ),
      mainPanel(
        textOutput("texto1"),
        plotOutput("grafica")
      )
    )
    
  )
)


