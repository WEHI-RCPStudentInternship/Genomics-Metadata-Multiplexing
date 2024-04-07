library(shiny)

# Source global configurations and definitions
source('R/global.R')

# Define and run the application
if (interactive()) {
    onStart()
    
    app <- shinyApp(ui=ui, server=server)
    runApp(app)
}
