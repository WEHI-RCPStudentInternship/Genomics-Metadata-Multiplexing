

mergeDataSampleSheetUI <- function() {
    div(
        h3("Merge Data into Sample Sheet"),
        p("This function merges FCS data either into a sample sheet or into a template sheet. Skips FCS merging if collation has not been run. You can either use the output sample sheet from the plate layout to spreadsheet operation, upload .tsv file (containing plate, well_position and sample columns) or upload an .xlsx spreadsheet containing a 'Sample' sheet with 'Plate#', 'Well position' and 'Sample name' columns. If you upload a template sheet, you must also upload a sample sheet. Note that your sample names will have to match exactly in your sample sheet and FCS file names to merge correctly. The merged file will be output as a .tsv file that can be downloaded."),
        fileInput("fcsFiles", "Upload FCS Files:", accept = c(".fcs"), multiple = TRUE),
        fileInput("sampleSheet", "Upload Sample Sheet:", accept = c(".tsv", ".xlsx")),
        fileInput("templateSheet", "Upload Template Sheet:", accept = c(".xlsx"))
    )
}