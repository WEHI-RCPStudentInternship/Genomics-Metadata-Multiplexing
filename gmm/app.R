library(shiny)
library(reticulate)

# Use the virtual environment
venv_dir <- "./venv"
use_virtualenv(venv_dir, required = TRUE)

ui <- fluidPage(
    titlePanel("GMM Data Processor"),
    sidebarLayout(
        sidebarPanel(
            fileInput('plate_layout', 'Choose Plate Layout File:'),
            fileInput('fcs_file', 'Choose FCS File:'),
            fileInput('template_sheet', 'Choose Template Sheet File:'),
            fileInput('primer_index', 'Choose Primer Index File:'),
            actionButton("process", "Process Files")
        ),
        mainPanel(
            tableOutput("dataOutput")
        )
    )
)

server <- function(input, output, session) {
    observeEvent(input$process, {
        req(input$plate_layout, input$fcs_file, input$template_sheet, input$primer_index)
        
        # Define the output file path
        output_file_path <- tempfile(fileext = ".csv")
        
        # Build command to run the Python script
        command <- sprintf("python ./fcs_converter.py --plate-layout %s --fcs-file %s --template-sheet %s --primer-index %s --output-file %s",
                           input$plate_layout$datapath,
                           input$fcs_file$datapath,
                           input$template_sheet$datapath,
                           input$primer_index$datapath,
                           output_file_path)
        
        # Execute the command
        system(command)
        
        # Read and display the output file
        outputData <- read.csv(output_file_path)
        output$dataOutput <- renderTable({
            outputData
        })
    })
}

shinyApp(ui = ui, server = server)
