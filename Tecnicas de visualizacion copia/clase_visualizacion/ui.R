library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Old Faithful Gayser Data"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("nbins", label = "número de agrupaciones",
                    min = 1, ,max = 100, value = 10)
      ),
      mainPanel(
        plotOutput("miOutputFavorito")
      )
    )
    
  )
)

