library(shiny)
library(shinythemes)
library(DT)

ui <- fluidPage(
    theme = shinytheme("flatly"), 
    tags$header(class = "navbar navbar-static-top",
                tags$div(class = "container-fluid",
                         style = "width: 100%; background-color: #9FE2BF; border-radius: 8px; margin-top: 10px",
                         tags$div(class = "navbar-header", 
                                  tags$div(class = "navbar-brand",
                                            style="display: flex; flex-direction: row; gap: 5px;",
                                           tags$img(src = "assets/wehi.png", height = "30px"),
                                            tags$span("Genomics Metadata Multiplexing", style = "vertical-align: middle; margin-left: 10px;") 
                                  )
                         )
                )
    ),
    sidebarPanel(
        class = "sidebar", 
        h4("Data Prepraration"), 
        fileInput('plate_layout', 'Choose Plate Layout File:', multiple = FALSE, accept = c('.xlsx')),
        fileInput('fcs_file', 'Choose FCS File:', multiple = FALSE, accept = c('.fcs')),
        fileInput('template_sheet', 'Choose Template Sheet File:', multiple = FALSE, accept = c('.xlsx')),
        fileInput('primer_index', 'Choose Primer Index File:', multiple = FALSE, accept = c('.xlsx')),
        actionButton("process", "Process Files", class = "btn-primary"),
        br(),br(),
        selectInput("format", "Select Download Format:", choices = c("CSV" = "csv", "TSV" = "tsv", "Excel" = "xlsx")),
        downloadButton("downloadData", "Download", class = "btn-success")
    ),
    mainPanel(
        uiOutput("dynamicUI"),
        style = "max-width: 80%;"
    )
)
