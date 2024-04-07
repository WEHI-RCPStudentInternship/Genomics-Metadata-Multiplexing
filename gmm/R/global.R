library(shiny)
library(shinythemes)

onStart <- function() {
    # Set any options or perform initializations here
    options(device.ask.default = FALSE)
    
    # For example, pre-load data or set global variables if not already done in global.R
    # load('data/mydata.RData') # Hypothetical example
    
    print("App is starting...")
}

# ui configuration
ui_config <- list(
    theme = shinytheme("paper"),
    lang = "en"
)
