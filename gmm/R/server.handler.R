# Function to handle file uploads and update reactive file paths
handleFileUpload <- function(input, session, filePaths) {
    observeEvent(input$plate_layout, {
        # Ensure a temporary directory exists for this session
        sessionTempDir <- file.path(tempdir(), session$token)
        if (!dir.exists(sessionTempDir)) {
            dir.create(sessionTempDir, recursive = TRUE)
        }
        
        # Copy the uploaded file to the session-specific temp directory
        newPath <- file.path(sessionTempDir, input$plate_layout$name)
        file.copy(input$plate_layout$datapath, newPath)
        
        # Update the file path to point to the new location
        filePaths$plate_layout <- newPath
    })
    
    observeEvent(input$fcs_file, {
        sessionTempDir <- file.path(tempdir(), session$token)
        if (!dir.exists(sessionTempDir)) {
            dir.create(sessionTempDir, recursive = TRUE)
        }
        newPath <- file.path(sessionTempDir, input$fcs_file$name)
        file.copy(input$fcs_file$datapath, newPath)
        filePaths$fcs_file <- newPath
    })
    
    observeEvent(input$template_sheet, {
        sessionTempDir <- file.path(tempdir(), session$token)
        if (!dir.exists(sessionTempDir)) {
            dir.create(sessionTempDir, recursive = TRUE)
        }
        newPath <- file.path(sessionTempDir, input$template_sheet$name)
        file.copy(input$template_sheet$datapath, newPath)
        filePaths$template_sheet <- newPath
    })
    
    observeEvent(input$primer_index, {
        sessionTempDir <- file.path(tempdir(), session$token)
        if (!dir.exists(sessionTempDir)) {
            dir.create(sessionTempDir, recursive = TRUE)
        }
        newPath <- file.path(sessionTempDir, input$primer_index$name)
        file.copy(input$primer_index$datapath, newPath)
        filePaths$primer_index <- newPath
    })
}


# Function to process files with a Python script
processFiles <- function(filePaths, outputFilePath) {
    # Ensure the output file path is in a writable and accessible location
    outputFilePath <- normalizePath(outputFilePath, mustWork = FALSE)
    
    command <- sprintf("python ./fcs_converter.py --plate-layout %s --fcs-file %s --template-sheet %s --primer-index %s --output-file %s",
                       shQuote(filePaths[[1]]), shQuote(filePaths[[2]]), shQuote(filePaths[[3]]), shQuote(filePaths[[4]]), shQuote(outputFilePath))
    
    command_output <- system(command, intern = TRUE, ignore.stderr = FALSE)
    print(command_output) # Print the command output for debugging
    
    return(outputFilePath)
}

# Function to enhance DataTable appearance
renderPrettyDataTable <- function(data) {
    renderDT({
        datatable(data, options = list(pageLength = 20, autoWidth = TRUE, 
                                       class = 'cell-border stripe',  # Add more styling options here
                                       dom = 'Bfrtip',  # Enable buttons and other features
                                       buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
                                       searchHighlight = TRUE),
                  extensions = 'Buttons')  # Enable extensions like Buttons
    })
}
