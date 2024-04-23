library(shiny)
library(DT) 

source("R/server.handler.R")

# Server function
server <- function(input, output, session) {
    thumbnail_image_handler(input, output, session)
    
    uploadedFilePaths <- data_upload_handler(input, output, session)
    
    processedData <- data_processing_handler(input, output, session, uploadedFilePaths)
    
    ui_display_handler(input, output, session, processedData)
    
    data_display_handler(input, output, session, processedData)
    
    # data_download_handler(input, output, session, processedData)
}

