library(shiny)
library(shinyjs)
library(DT)

server <- function(input, output, session) {
    # Placeholder for the processed data
    processedData <- reactiveVal()
    
    # Handler to copy uploaded files to a temporary directory
    copyFilesToTemp <- function(uploadedFiles) {
        temp_dir <- tempfile()
        dir.create(temp_dir)
        
        lapply(uploadedFiles, function(file) {
            file.copy(file$datapath, file.path(temp_dir, file$name))
            file.path(temp_dir, file$name)
        })
    }
    
    # Handler to process files with Python script
    processFiles <- function(filePaths) {
        command <- sprintf("python ./fcs_converter.py --plate-layout %s --fcs-file %s --template-sheet %s --primer-index %s --output-file %s",
                           filePaths[[1]], filePaths[[2]], filePaths[[3]], filePaths[[4]], filePaths[[5]])
        
        command_output <- system(command, intern = TRUE, ignore.stderr = FALSE)
        print(command_output) # Debug: Print command output and errors
    }
    
    # Handler for displaying processed data
    displayProcessedData <- function(outputFilePath) {
        outputData <- read.csv(outputFilePath)
        processedData(outputData)  # Store the processed data
        
        output$dataOutput <- DT::renderDataTable({
            processedData()
        }, options = list(pageLength = 20, autoWidth = TRUE, 
                          class = 'cell-border stripe',  # Add more styling options here
                          dom = 'Bfrtip',  # Enable buttons and other features
                          buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
                          searchHighlight = TRUE))  # Set initial page length to 5 rows
    }

    # Main processing logic
    observeEvent(input$process, {
        req(input$plate_layout, input$fcs_file, input$template_sheet, input$primer_index)
        
        # Copy uploaded files to a temporary directory
        filePaths <- copyFilesToTemp(list(input$plate_layout, input$fcs_file, input$template_sheet, input$primer_index))
        outputFilePath <- tempfile(fileext = ".csv")
        filePaths <- c(filePaths, outputFilePath)  # Include output file path
        
        # Process files
        processFiles(filePaths)
        
        # Display processed data
        displayProcessedData(outputFilePath)
    })
    
    # Download handler
    output$downloadData <- downloadHandler(
        filename = function() {
            paste("processed-data", Sys.Date(), ".", input$format, sep="")
        },
        content = function(file) {
            format <- input$format
            data <- processedData()
            if (format == "csv") {
                write.csv(data, file, row.names = FALSE)
            } else if (format == "tsv") {
                write.table(data, file, sep = "\t", row.names = FALSE)
            } else if (format == "xlsx") {
                writexl::write_xlsx(data, file)
            }
        }
    )
}
