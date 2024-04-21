library(shiny)
library(shinyjs)

source('R/server_components/homePage.server.R')

server <- function(input, output, session) {
    homePageServerHandler(input, output, session)
}
