plateLayoutDescription <- function() {
    
    div(
        h3("Plate Layout to Spreadsheet"),
        p('This function handles the conversion of a plate layout to sample sheet. Upload a colour-coded plate layout in Excel (.xlsx) format with well marked row A-P and columns 1-24. The cells under "sorted description" should contain sample colours below and sample names to the right of each colour (there should be no more than two blank rows within the list of samples).')
    )
}

plateLayoutUI <- function() {
    div(
        plateLayoutDescription(),
        fileInput("plateFile", "Upload Plate Layout:", accept = c(".xlsx"), multiple = TRUE),
        uiOutput("fileDeleteButtons") 
    )
}
