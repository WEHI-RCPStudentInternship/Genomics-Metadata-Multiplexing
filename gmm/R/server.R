library(shiny)
library(shinyjs)

source("R/utils/custom_file_input.R")
source("R/server_components/tutorial_server.R")
source("R/server_components/operations_server.R")
source("R/server_components/utils.R")

server <- function(input, output, session) {
    
    switchTab(input, output, session)

    operationServer(input, output, session)
    
}
