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
                                            tags$span("Genomics Metadata Multiplexing Celseq2 FCS Data Processor", style = "vertical-align: middle; margin-left: 10px;") 
                                  )
                         )
                )
    ),
    sidebarPanel(
        div(
            h5("Operation 1: Create Sample Sheet from Plate Layout", style = "font-weight: bold;"),
            fileInput('plate_layout', 'Choose Plate Layout File:', multiple = FALSE, accept = c('.xlsx')),
            p("Converts the provided 'Plate Layout' sheet into a detailed sample sheet."),
            actionLink("viewOp1", "See sample Plate Layout file")
        ),
        
        div(
            h5("Operation 2: Combine FCS Files into One Document", style = "font-weight: bold;"),
            fileInput('fcs_file', 'Choose FCS File:', multiple = FALSE, accept = c('.fcs')),
            p("Merges multiple FCS files into a single .tsv file.")
        ),
        
        div(
            h5("Operation 3: Merge All Data into One Comprehensive File", style = "font-weight: bold;"),
            fileInput('template_sheet', 'Choose Template Sheet File:', multiple = FALSE, accept = c('.xlsx')),
            p("Integrates the sample sheet, a template sheet, and the FCS results."),
            actionLink("viewOp3", "See sample Template file")
        ),
        
        div(
            h5("Operation 4 (Optional): Add Primer Index to Comprehensive File", style = "font-weight: bold;"),
            fileInput('primer_index', 'Choose Primer Index File:', multiple = FALSE, accept = c('.xlsx')),
            p("(Optional) Enhances the comprehensive file by adding Primer Index information."),
            actionLink("viewOp4", "See sample Primer Index file")
        ),

        div(),
        actionButton("process", "Process Files", class = "btn-primary"),
        
        selectInput("format", "Select Download Format:",
                    choices = c("CSV" = "csv", "TSV" = "tsv", "Excel" = "xlsx")),
        
        downloadButton("downloadData", "Download", class = "btn-success")
    ),
    mainPanel(
        tags$div(style = "overflow-y: scroll; width: 100%;",
                 DT::dataTableOutput("dataOutput")),
        style = "max-width: 80%;"
    )
)
