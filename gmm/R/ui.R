library(shiny)
library(shinythemes)
library(shinyjs)

# Ensure your ui_component functions return tabPanel objects or are wrapped in tabPanel when called here.
source('R/ui_components/homepage.R')
source('R/ui_components/func1_plate_to_spreadsheet.R')
source('R/ui_components/func2_collate_fcs_data.R')
source('R/ui_components/func3_merge_fcs_data.R')

addResourcePath("assets", "R/www/assets") 

navbar_title <- div(
    img(src = "assets/wehi.png", height = "30px"), " ",
    "Genomics Metadata Multiplexing Project"
)

ui <- fluidPage(
    useShinyjs(),  # Initialize shinyjs for enhanced functionality
    navbarPage(id = "mainTabs",
               title = navbar_title,
               homepage(),  
               func1_plate_to_spreadsheet(),
               func2_collate_fcs_data(),
               func3_merge_fcs_data()
    )
)
