source("R/ui.homepage.R")

# Thumbnail image handler function
thumbnail_image_handler <- function(input, output, session) {
    # Modal display functions for sample files
    observeEvent(input$viewOp1, {
        showModal(modalDialog(
            title = "Sample Plate Layout Sheet for Operation 1",
            tags$img(src = "assets/plate_layout.jpg", style = "width:100%;"),
            easyClose = TRUE,
            footer = NULL
        ))
    })
    
    observeEvent(input$viewOp3, {
        showModal(modalDialog(
            title = "Sample Template Sheet for Operation 3",
            tags$img(src = "assets/template_sheet.jpg", style = "width:100%;"),
            easyClose = TRUE,
            footer = NULL
        ))
    })
    
    observeEvent(input$viewOp4, {
        showModal(modalDialog(
            title = "Sample Primer Index File for Operation 4",
            tags$img(src = "assets/primer_index.jpg", style = "width:100%;"),
            easyClose = TRUE,
            footer = NULL
        ))
    })
}

# Data download handler function
data_download_handler <- function(input, output, session, processedData) {
    output$downloadData <- downloadHandler(
        filename = function() {
            paste("processed-data-", Sys.Date(), ".", input$format, sep = "")
        },
        content = function(file) {
            # Depending on the selected format, write the processed data to the file
            if (input$format == "csv") {
                write.csv(processedData(), file, row.names = FALSE)
            } else if (input$format == "tsv") {
                write.table(processedData(), file, sep = "\t", row.names = FALSE)
            } else if (input$format == "xlsx") {
                # Assuming you have the 'writexl' package for Excel files
                writexl::write_xlsx(processedData(), file)
            }
        }
    )
}

# Data upload handler function
data_upload_handler <- function(input, output, session) {
    # Ensure the "temp/data" directory exists
    if (!dir.exists("temp/data")) {
        dir.create("temp/data", recursive = TRUE)
    }
    
    # Reactive values to store uploaded file paths
    uploadedFilePaths <- reactiveValues(
        plate_layout = NULL,
        fcs_file = NULL,
        template_sheet = NULL,
        primer_index = NULL
    )
    
    observe({
        # Update reactive values with uploaded file paths
        if (!is.null(input$plate_layout)) {
            destPath <- paste0("temp/data/", input$plate_layout$name)
            file.copy(input$plate_layout$datapath, destPath)
            uploadedFilePaths$plate_layout <- destPath
        }
        if (!is.null(input$fcs_file)) {
            destPath <- paste0("temp/data/", input$fcs_file$name)
            file.copy(input$fcs_file$datapath, destPath)
            uploadedFilePaths$fcs_file <- destPath
        }
        if (!is.null(input$template_sheet)) {
            destPath <- paste0("temp/data/", input$template_sheet$name)
            file.copy(input$template_sheet$datapath, destPath)
            uploadedFilePaths$template_sheet <- destPath
        }
        if (!is.null(input$primer_index)) {
            destPath <- paste0("temp/data/", input$primer_index$name)
            file.copy(input$primer_index$datapath, destPath)
            uploadedFilePaths$primer_index <- destPath
        }
    })
    return(uploadedFilePaths)
}

data_processing_handler <- function(input, output, session, uploadedFilePaths) {
    processedData <- reactiveVal(NULL)  # To store the result of processing
    
    observeEvent(input$process, {
        # Ensure all required files are uploaded
        req(uploadedFilePaths$plate_layout, uploadedFilePaths$fcs_file, uploadedFilePaths$template_sheet, uploadedFilePaths$primer_index)
        
        # Temporary file for processed data output, stored in the "temp/data" directory
        outputFilePath <- tempfile(fileext = ".csv", tmpdir = "temp/data")
        
        # Construct the command to call the external Python script with the updated file paths
        command <- sprintf("python ./fcs_converter.py --plate-layout %s --fcs-file %s --template-sheet %s --primer-index %s --output-file %s",
                           shQuote(uploadedFilePaths$plate_layout), shQuote(uploadedFilePaths$fcs_file), 
                           shQuote(uploadedFilePaths$template_sheet), shQuote(uploadedFilePaths$primer_index), 
                           shQuote(outputFilePath))
        
        # Execute the command and capture output
        command_output <- system(command, intern = TRUE, ignore.stderr = FALSE, wait = TRUE)
        print(command_output)
        
        # Now, check if the processed data file was successfully created by the command
        if (file.exists(outputFilePath)) {
            processedData(read.csv(outputFilePath, stringsAsFactors = FALSE))
        } else {
            # If the file doesn't exist, log an error message
            print(paste("File not found after processing:", outputFilePath))
        }
    })
    
    return(processedData)
}



# Data display handler function
data_display_handler <- function(input, output, session, processedData) {
    output$dataOutput <- renderDT({
        req(processedData())  # Ensure there's data to display
        datatable(processedData(), options = list(pageLength = 20, autoWidth = TRUE, 
                                                  class = 'cell-border stripe', 
                                                  dom = 'Bfrtip',
                                                  buttons = c('copy', 'csv', 'excel', 'pdf', 'print', 'colvis'),
                                                  searchHighlight = TRUE),
                  filter = 'top')
    })
}

ui_display_handler <- function(input, output, session, processedData) {
    output$dynamicUI <- renderUI({
        # Check if processedData is NULL or has no rows
        if (is.null(processedData()) || nrow(processedData()) == 0) {
            homepage_info()
        } else {
            # Data is available, display the DataTable
            tags$div(style = "overflow-y: scroll; width: 100%;",
                     DT::dataTableOutput("dataOutput"))
        }
    })
}