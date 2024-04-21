library(shiny)
library(shinythemes)
library(DT)

ui <- fluidPage(
    theme = shinytheme("flatly"), 
    tags$header(class = "navbar navbar-static-top",
                tags$div(class = "container-fluid",
                         tags$div(class = "navbar-header",
                                  tags$span(class = "navbar-brand",
                                            href = "#",
                                            # Use inline CSS for vertical alignment
                                            tags$img(src = "assets/wehi.png", height = "30px", style = "vertical-align: middle;"), 
                                            tags$span("GMM FCS Data Processor", style = "vertical-align: middle; margin-left: 10px;") 
                                  )
                         )
                )
    ),
    sidebarLayout(
        sidebarPanel(
            fileInput('plate_layout', 'Choose Plate Layout File:', multiple = FALSE, accept = c('.xlsx')),
            fileInput('fcs_file', 'Choose FCS File:', multiple = FALSE, accept = c('.fcs')),
            fileInput('template_sheet', 'Choose Template Sheet File:', multiple = FALSE, accept = c('.xlsx')),
            fileInput('primer_index', 'Choose Primer Index File:', multiple = FALSE, accept = c('.xlsx')),
            actionButton("process", "Process Files", class = "btn-primary"),
            selectInput("format", "Select Download Format:",
                        choices = c("CSV" = "csv", "TSV" = "tsv", "Excel" = "xlsx")),
            downloadButton("downloadData", "Download", class = "btn-success")
        ),
        mainPanel(
            tags$div(style = "overflow-y: scroll; max-height: 600px; width: 100%;",
                     DT::dataTableOutput("dataOutput")),
            style = "max-width: 80%;"
        )
    )
)
