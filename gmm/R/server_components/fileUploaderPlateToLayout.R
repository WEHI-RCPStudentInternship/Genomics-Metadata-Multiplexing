fileUploaderPlateToLayout <- function(input, output, session) {
    # Reactive value to store the list of currently uploaded files
    uploadedFiles <- reactiveVal(list())
    
    # Handle file uploads
    observeEvent(input$plateFile, {
        req(input$plateFile)
        
        tempDir <- "temp/plate"
        if (!dir.exists(tempDir)) {
            dir.create(tempDir, recursive = TRUE)
        }
        
        # Process the uploaded files
        newFiles <- lapply(seq_along(input$plateFile$name), function(i) {
            # Generate a unique file name to avoid conflicts
            safeTimestamp <- gsub("[[:punct:] ]", "_", format(Sys.time(), "%Y-%m-%d_%H-%M-%S"))
            uniqueName <- paste0(safeTimestamp, "_", gsub("[[:punct:] ]", "_", input$plateFile$name[i]))
            destPath <- file.path(tempDir, uniqueName)
            
            # Move the file to the temporary directory
            file.copy(input$plateFile$datapath[i], destPath)
            
            return(list(name = uniqueName, originalName = input$plateFile$name[i]))
        })
        
        # Update the list of uploaded files
        uploadedFiles(newFiles)
    }, ignoreInit = TRUE)
    
    # Dynamically generate UI for each uploaded file and its delete button
    output$fileDeleteButtons <- renderUI({
        files <- uploadedFiles()
        lapply(files, function(file) {
            fluidRow(
                column(8, textOutput(outputId = paste0("file_name_", gsub("[[:punct:] ]", "_", file$name)))),
                column(4, actionButton(inputId = paste0("delete_", gsub("[[:punct:] ]", "_", file$name)), label = "Delete"))
            )
        })
    })
    
    # Display file names
    observe({
        for (file in uploadedFiles()) {
            local({
                localFile <- file
                output[[paste0("file_name_", gsub("[[:punct:] ]", "_", localFile$name))]] <- renderText({
                    localFile$originalName
                })
            })
        }
    })
    
    # Handle file deletion
    observe({
        for (file in uploadedFiles()) {
            local({
                localFile <- file
                observeEvent(input[[paste0("delete_", gsub("[[:punct:] ]", "_", localFile$name))]], {
                    # Remove the file
                    filePath <- file.path("temp/plate", localFile$name)
                    if (file.exists(filePath)) {
                        file.remove(filePath)
                    }
                    # Update the list of uploaded files
                    currentFiles <- uploadedFiles()
                    updatedFiles <- Filter(function(x) x$name != localFile$name, currentFiles)
                    uploadedFiles(updatedFiles)
                    
                    # Clear the file input to allow re-uploading the same file
                    shinyjs::runjs(sprintf("clearFileInput('%s')", "plateFile"))
                })
            })
        }
    })
}
