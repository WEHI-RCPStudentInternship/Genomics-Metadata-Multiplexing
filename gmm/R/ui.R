library(shiny)
library(shinythemes)
library(shinyjs)

source('R/ui_components/homepage.R')
source('R/ui_components/operations.R')
# source('R/ui_components/tutorial.R')

addResourcePath("assets", "R/www/assets") 

navbar_title <- div(
    style = "display: flex; align-items: center;",
    img(src = "assets/wehi.png", height = "30px", style = "margin-right: 10px;")
)

ui <- fluidPage(
    tags$head(
        tags$script(HTML("
            function clearFileInput(id) {
                $('#' + id).val('');
            }
        "))
    ),
    useShinyjs(), 
    includeCSS("R/www/global.css"),
    includeCSS("R/www/operations.css"),
    tags$script(src = "https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap"),
    title = "WEHI Genomics Metadata Multiplexing Project",
    navbarPage(id = "mainTabs",
               title = navbar_title,
               homepage(),  
               operations()
    )
)
