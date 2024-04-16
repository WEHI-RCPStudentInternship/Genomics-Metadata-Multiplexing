source("R/ui_components/plateLayoutUI.R")
source("R/ui_components/collateFCSUI.R")
source("R/ui_components/mergeDataSampleSheetUI.R")
source("R/ui_components/mergeIndexFileUI.R")

operationServer <- function(input, output, session) {
    # Logic to enable the submit button when all required files are uploaded
    output$operationDetails <- renderUI({
        switch(input$operation,
               "plateLayout" = plateLayoutUI(),
               "collateFCS" = collateFCSUI(),
               "mergeDataSampleSheet" = mergeDataSampleSheetUI(),
               "mergeIndexFile" = mergeIndexFileUI()
               # Add other cases if any...
        )
    })
}