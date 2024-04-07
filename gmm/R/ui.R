library(shiny)
library(shinythemes)

source('R/ui_components/homepage.R')
source('R/ui_components/func1_plate_to_spreadsheet.R')
source('R/ui_components/func2_collate_fcs_data.R')
source('R/ui_components/func3_merge_fcs_data.R')
source('R/ui_components/func4_fcs_to_csv.R')

addResourcePath("assets", "R/www/assets")

navbar_title <- div(
    img(src="assets/wehi.png", height = "30px"), " ",
    "Genomics Metadata Multiplexing Project"
)

ui <- fluidPage(
    theme = ui_config$theme,
    lang = ui_config$lang,
    # titlePanel("Genomics Metadata Multiplexing"),
    
    # Sidebar with a slider input for number of bins
    navbarPage(
        title=navbar_title,
        homepage,
        func1_plate_to_spreadsheet,
        func2_collate_fcs_data,
        func3_merge_fcs_data,
        # func4_fcs_to_csv,
    )
)
