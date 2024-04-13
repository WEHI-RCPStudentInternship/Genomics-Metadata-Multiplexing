

operations <- function() {
    
    tabPanel(
        'FCS Operations',
        value = "plateLayoutTab",
        sidebarPanel(
            h2("Select Operation"),
            selectInput("operation", "Choose an operation:",
                        choices=list("Plate Layout to Spreadsheet", "plateLayout",
                                     "Collabte FCS Files" = "collateFCS",
                                     "Merge Data into Sample Sheet" = "mergeDataSampleSheet",
                                     "Merge Primer Index File" = "mergeIndexFile")),
            conditionalPanel(
                condition = "input.operation == 'plateLayout'",
                h3("Plate Layout to Spreadsheet"),
                p('This function handles the conversion of a plate layout to sample sheet. Upload a colour-coded plate layout in Excel (.xlsx) format with well marted row A-P and columns 1-24. The cells under "sorted description" should contain smaple colours below and sample names to the right of each colour (there should be no more than two blank rows within the list of samples)'),
            ),
            conditionalPanel(
                condition = "input.operation == 'collateFCS'",
                h3("Collate FCS Files"),
                p("This function merges FCS files into a single file. Upload FCS files to be merged. Ensure that your file name matches the sample names above. The expected file name format is date_sample_plate.fcs. The merged file will be output as a .tsv file that can be downloaded and used for downstream merging.")
            ),
            conditionalPanel(
                condition = "input.operation == 'mergeDataSampleSheet'",
                h3("Merge Data into Sample Sheet"),
                p("This function merges FCS data either into a sample sheet or into a template sheet. Skips FCS merging if collation has not been run. You can either use the outptu sample sheet from the plate layout to spreadsheet operation, upload .tsv file (containing plate, well_position and sample columns) or upload an .xlsx spreadsheet containing a 'Sample' sheet with 'Plate#', 'Well position' and 'Sample name' columns. If you upload an template sheet, you must also upload a sample sheet. Note that your sample names will have to match exactly in your sample sheet and FCS file names to merge correctly. The merged file will be output as a .tsv file that can be downloaded.")
            ),
            conditionalPanel(
                condition = "input.operation == 'mergeIndexFile'",
                h2("Merge Index File"),
                p("This function allows users to merge primer indices from a file into the main dataset. Upload your index file and template sheet below to begin the process.")
            )
        ),
        mainPanel(
            div(id="fileUploaderBar", class = "fileUploaderBar",
                div(id = "plateFile", class = "dropbox-area disabled", 
                    h4("Plate Spreadsheet"), 
                    fileInput("plateFileInput", label = NULL)),
                div(id = "sampleSheet", class = "dropbox-area disabled", 
                    h4("Sample Sheet"), 
                    fileInput("sampleSheetInput", label = NULL)),
                div(id = "templateSheet", class = "dropbox-area disabled", 
                    h4("Template Sheet"), 
                    fileInput("templateSheetInput", label = NULL)),
                div(id = "fcsFiles", class = "dropbox-area disabled", 
                    h4("FCS Files"), 
                    fileInput("fcsFilesInput", label = NULL, multiple = TRUE)),
                div(id = "indexFile", class = "dropbox-area disabled", 
                    h4("Primer Index Files"), 
                    fileInput("indexFileInput", label = NULL))
            )
        )
    )
}
