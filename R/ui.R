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
                                           tags$img(src = "wehi.png", height = "30px"),
                                            tags$span("Genomics Metadata Multiplexing", style = "vertical-align: middle; margin-left: 10px;") 
                                  )
                         )
                )
    ),
    tags$head(
        tags$style(HTML("
            .dt-button {
                background-color: #d3e0d7 !important;
                color: black !important;
                border-radius: 5px !important; 
                border: none !important;
                padding: 5px 10px !important;
                margin-right: 5px !important;
            }

            .dt-button:hover {
                box-shadow: 0 2px 4px 0 rgba(0,0,0,.2), 0 3px 10px 0 rgba(0,0,0,.19) !important; 
            }
            
            .btn-primary {
                width: 200px;
            }
        "))
    ),
    tags$head(
        tags$style(HTML("
      .sidebar {
        background-color: #f4f4f4;
        padding: 20px;
      }
      .form-group {
        margin-bottom: 20px;
      }
      .folder-input-wrapper {
        position: relative;
        overflow: hidden;
        display: inline-block;
      }
      .folder-input {
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0;
        width: 100%;
        height: 100%;
        cursor: pointer;
      }
      .custom-folder-input {
        border: 2px solid #007bff;
        color: #fff;
        background-color: #007bff;
        padding: 10px 15px;
        border-radius: 5px;
        font-size: 16px;
        text-align: center;
        display: inline-block;
        cursor: pointer;
        width: 200px;
      }
      .custom-folder-input:hover {
        background-color: #0056b3;
        border-color: #0056b3;
      }
    ")),
        tags$script(HTML("
      $(document).on('change', '.folder-input', function(e) {
        var files = e.target.files;
        if(files.length > 0) {
          Shiny.setInputValue('folderFiles', files, {priority: 'event'});
        }
      });
    "))
    ),
    sidebarPanel(
        class = "sidebar", 
        h4("Data Preparation"), 
        
        div(
            p("Before data processing, you must select a folder that contains the following files:"),
            p("To ensure the application runs properly, all uploaded files should have the following name convention:"),
            tags$ul(
                tags$li(HTML("<strong>Plate Layout Sheet:</strong> Must contain the keyword <em>plate_spreadsheet</em>.")),
                tags$li(HTML("<strong>CelSeq2 FCS Files:</strong> All files ending with <em>.fcs</em>.")),
                tags$li(HTML("<strong>Single Template Sheet:</strong> Must contain the keyword <em>template_sheet</em>.")),
                tags$li(HTML("<strong>(Optional) Single Primer Index Sheet:</strong> Must contain the keyword <em>primer-index</em>."))
            )
        ),
        
        tags$div(
            class = "form-group shiny-input-container",
            tags$label("Step 1: Choose a Folder"),
            br(),br(),
            div(
                class = "folder-input-wrapper",
                tags$input(
                    type = "file",
                    id = "folder_input",
                    class = "folder-input",
                    webkitdirectory = "true",
                    directory = "true",
                    multiple = "true"
                ),
                span(class = "custom-folder-input", "Select Folder")
            )
        ),
        tags$div(
            id = "progress_bar",
            uiOutput("upload_progress")
        ),

        tags$label("Step 2: Processing Files"),
        br(),br(),
        actionButton("process", "Process Files", class = "btn-primary", style="{width: 200px;}"),
        br(),br(),
        selectInput("format", "Select Download Format:", choices = c("CSV" = "csv", "TSV" = "tsv", "Excel" = "xlsx")),
        downloadButton("downloadData", "Download Processed File", class = "btn-success")
    ),
    mainPanel(
        uiOutput("dynamicUI"),
        style = "max-width: 80%;"
    )
)
