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

data_upload_handler <- function(input, output, session) {
    # Ensure the "temp/data" directory exists
    if (!dir.exists("temp/data")) {
        dir.create("temp/data", recursive = TRUE)
    }
    
    # Initialize reactive values to store uploaded file paths
    uploadedFilePaths <- reactiveValues(
        plate_layout = "",
        fcs_files = list(),
        template_sheet = "",
        primer_index = ""
    )
    
    # Handle Plate Layout File Upload
    observeEvent(input$plate_layout, {
        if (!is.null(input$plate_layout)) {
            destPath <- paste0("temp/data/", input$plate_layout$name)
            file.copy(input$plate_layout$datapath, destPath)
            uploadedFilePaths$plate_layout <- destPath
        }
    }, ignoreNULL = TRUE)
    
    # Handle Multiple FCS Files Upload
    observeEvent(input$fcs_file, {
        if (!is.null(input$fcs_file)) {
            # Initialize an empty list for storing paths of uploaded FCS files
            fcs_files_paths <- list()
            
            for (i in 1:nrow(input$fcs_file)) {
                destPath <- paste0("temp/data/", input$fcs_file$name[i])
                file.copy(input$fcs_file$datapath[i], destPath)
                fcs_files_paths <- c(fcs_files_paths, destPath)
            }
            
            # Update the reactive value with the new list of FCS file paths
            uploadedFilePaths$fcs_files <- fcs_files_paths
        }
    }, ignoreNULL = TRUE)
    
    # Handle Template Sheet Upload
    observeEvent(input$template_sheet, {
        if (!is.null(input$template_sheet)) {
            destPath <- paste0("temp/data/", input$template_sheet$name)
            file.copy(input$template_sheet$datapath, destPath)
            uploadedFilePaths$template_sheet <- destPath
        }
    }, ignoreNULL = TRUE)
    
    # Handle Primer Index File Upload
    observeEvent(input$primer_index, {
        if (!is.null(input$primer_index)) {
            destPath <- paste0("temp/data/", input$primer_index$name)
            file.copy(input$primer_index$datapath, destPath)
            uploadedFilePaths$primer_index <- destPath
        }
    }, ignoreNULL = TRUE)
    
    return(uploadedFilePaths)
}



data_processing_handler <- function(input, output, session, uploadedFilePaths) {
    processedData <- reactiveVal(NULL)  # To store the result of processing
    
    # Listen for the 'process' button click
    observeEvent(input$process, {
        # Ensure all required files are uploaded
        req(uploadedFilePaths$plate_layout, uploadedFilePaths$fcs_files, uploadedFilePaths$template_sheet)
        
        cat("Process button clicked, starting data processing...\n")
        
        # Assuming uploadedFilePaths$fcs_files is a list of file paths
        # Join multiple FCS file paths into a single string if necessary
        fcs_files_argument <- paste(uploadedFilePaths$fcs_files, collapse = " ")
        outputFilePath <- tempfile(fileext = ".csv", tmpdir = "temp/data")
        # Construct the command to call the external Python script with the updated file paths
        command <- sprintf("python ./fcs_converter.py --plate-layout %s --fcs-files %s --template-sheet %s --primer-index %s --output-file %s",
                           shQuote(uploadedFilePaths$plate_layout), 
                           shQuote(fcs_files_argument), 
                           shQuote(uploadedFilePaths$template_sheet), 
                           shQuote(uploadedFilePaths$primer_index), 
                           shQuote(outputFilePath))
        
        # Execute the command and capture output
        command_output <- system(command, intern = TRUE, ignore.stderr = FALSE, wait = TRUE)
        print(command_output)
        
        # Now, check if the processed data file was successfully created by the command
        if (file.exists(outputFilePath)) {
            processedData(read.csv(outputFilePath, stringsAsFactors = FALSE))
        } else {
            # If the file doesn't exist, log an error message
            print(paste("Something Wrong with the application, please try again."))
        }
    })
    
    return(processedData)
}





# Data display handler function
data_display_handler <- function(input, output, session, processedData) {
    output$dataOutput <- renderDT({
        req(processedData())  # Ensure there's data to display
        
        datatable(processedData(), extensions = 'Buttons', options = list(
            pageLength = 20,
            autoWidth = TRUE,
            scrollX = TRUE,  # Enable horizontal scrolling
            scrollCollapse = TRUE,
            dom = 'Bfrtip',
            buttons = c('copy', 'csv', 'tsv', 'excel', 'pdf', 'colvis'),
            searchHighlight = TRUE,
            columnDefs = list(list(className = 'dt-center', targets = '_all')),  # Center align all columns
            initComplete = JS(
                "function(settings, json) {",
                "$(this.api().table().header()).css({'background-color': '#F0F0F0', 'color': '#000000'});", 
                "}"
            )
        ), filter = 'top', rownames = FALSE)
        
        
    })
}

ui_display_handler <- function(input, output, session, processedData) {
    output$dynamicUI <- renderUI({
        # First, check if processedData is NULL
        if (is.null(processedData())) {
            homepage_info()
        } else {
            # If processedData is not NULL, check if it's a dataframe with rows
            if (is.data.frame(processedData()) && nrow(processedData()) > 0) {
                # Data is available and is a non-empty dataframe, display the DataTable
                tags$div(style = "overflow-y: scroll; width: 100%;",
                         DT::dataTableOutput("dataOutput"))
            } else if(is.list(processedData()) && length(processedData()) > 0) {
                # If processedData is a list and not empty, handle accordingly
                # This part is optional and should be adapted based on your data structure
                # For example, you might want to display a message or handle list data differently
                tags$div("Data is available but not in dataframe format.")
            } else {
                # If processedData is not NULL but also not a non-empty dataframe or list
                homepage_info()
            }
        }
    })
}
