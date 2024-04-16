

mergeIndexFileUI <- function() {
    div(
        h3("Merge Index File"),
        p("This function allows users to merge primer indices from a file into the main dataset. Upload your index file and template sheet below to begin the process."),
        fileInput("fcsFiles", "Upload FCS Files:", accept = c(".fcs"), multiple = TRUE),
        fileInput("indexFile", "Upload Index File:", accept = c(".xlsx")),
        fileInput("templateSheetForIndex", "Upload Template Sheet:", accept = c(".xlsx"))
    )
}