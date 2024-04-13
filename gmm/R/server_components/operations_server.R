
operationServer <- function(input, output, session) {
    # Dynamic UI for displaying file input boxes based on the selected operation
    output$fileInputUI <- renderUI({
        switch(input$operation,
               "plateLayout" = fileInput("plateFile", "Upload Plate Layout:", accept = c(".xlsx")),
               "collateFCS" = fileInput("fcsFiles", "Upload FCS Files:", accept = c(".fcs"), multiple = TRUE),
               "mergeDataSampleSheet" = tagList(
                   fileInput("sampleSheet", "Upload Sample Sheet:", accept = c(".tsv", ".xlsx")),
                   fileInput("templateSheet", "Upload Template Sheet:", accept = c(".xlsx"))
               ),
               "mergeIndexFile" = tagList(
                   fileInput("indexFile", "Upload Index File:", accept = c(".xlsx")),
                   fileInput("templateSheetForIndex", "Upload Template Sheet:", accept = c(".xlsx"))
               )
        )
    })
    
    # Logic to enable the submit button when all required files are uploaded
    output$operationDetails <- renderUI({
        switch(input$operation,
               "plateLayout" = {
                   tagList(
                       h3("Plate Layout to Spreadsheet"),
                       p('This function handles the conversion of a plate layout to sample sheet. Upload a colour-coded plate layout in Excel (.xlsx) format with well marked row A-P and columns 1-24. The cells under "sorted description" should contain sample colours below and sample names to the right of each colour (there should be no more than two blank rows within the list of samples).'),
                       fileInput("plateFile", "Upload Plate Layout:", accept = c(".xlsx"))
                   )
               },
               "collateFCS" = {
                   tagList(
                       h3("Collate FCS Files"),
                       p("This function merges FCS files into a single file. Upload FCS files to be merged. Ensure that your file name matches the sample names above. The expected file name format is date_sample_plate.fcs. The merged file will be output as a .tsv file that can be downloaded and used for downstream merging."),
                       fileInput("fcsFiles", "Upload FCS Files:", accept = c(".fcs"), multiple = TRUE)
                   )
               },
               "mergeDataSampleSheet" = {
                   tagList(
                       h3("Merge Data into Sample Sheet"),
                       p("This function merges FCS data either into a sample sheet or into a template sheet. Skips FCS merging if collation has not been run. You can either use the output sample sheet from the plate layout to spreadsheet operation, upload .tsv file (containing plate, well_position and sample columns) or upload an .xlsx spreadsheet containing a 'Sample' sheet with 'Plate#', 'Well position' and 'Sample name' columns. If you upload a template sheet, you must also upload a sample sheet. Note that your sample names will have to match exactly in your sample sheet and FCS file names to merge correctly. The merged file will be output as a .tsv file that can be downloaded."),
                       fileInput("sampleSheet", "Upload Sample Sheet:", accept = c(".tsv", ".xlsx")),
                       fileInput("templateSheet", "Upload Template Sheet:", accept = c(".xlsx"))
                   )
               },
               "mergeIndexFile" = {
                   tagList(
                       h3("Merge Index File"),
                       p("This function allows users to merge primer indices from a file into the main dataset. Upload your index file and template sheet below to begin the process."),
                       fileInput("indexFile", "Upload Index File:", accept = c(".xlsx")),
                       fileInput("templateSheetForIndex", "Upload Template Sheet:", accept = c(".xlsx"))
                   )
               }
        )
    })
}