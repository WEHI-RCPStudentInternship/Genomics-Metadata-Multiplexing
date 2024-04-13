library(shiny)
library(shinythemes)
library(shinyjs)

# Ensure your ui_component functions return tabPanel objects or are wrapped in tabPanel when called here.
source('R/ui_components/homepage.R')
source('R/ui_components/operations.R')
source('R/ui_components/tutorial.R')

addResourcePath("assets", "R/www/assets") 

navbar_title <- div(
    img(src = "assets/wehi.png", height = "30px"), " ",
    "Genomics Metadata Multiplexing Project"
)

ui <- fluidPage(
    useShinyjs(), 
    includeCSS("R/www/operations.css"),
    navbarPage(id = "mainTabs",
               title = navbar_title,
               homepage(),  
               operations(),
               tutorial()
    )
)
