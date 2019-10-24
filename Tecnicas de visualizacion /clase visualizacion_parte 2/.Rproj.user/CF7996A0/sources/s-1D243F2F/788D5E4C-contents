#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("50 euros"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("n", label = h2("tamaño muestral"), min = 5 , max = 500, value = 33),
            selectInput("distribution", label = "distribucion",
                          choices = list("Gauss" = "norm","uniforme" = "unif"),
                          selected = "Gauss"),
            actionButton("pintar", label = "cobrar 50 euros")
                
    
        ),
        

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        input$pintar
        rdistribucion <- ifelse(isolate(input$distribution) == "norm", rnorm, runif)
        
        hist(rdistribucion(isolate(input$n)))
        
    })
}
        
# Run the application 
shinyApp(ui = ui, server = server)

        