
collateFCSUI <- function() {
    div(
        h3("Collate FCS Files"),
        p("This function merges FCS files into a single file. Upload FCS files to be merged. Ensure that your file name matches the sample names above. The expected file name format is date_sample_plate.fcs. The merged file will be output as a .tsv file that can be downloaded and used for downstream merging."),
        fileInput("fcsFiles", "Upload FCS Files:", accept = c(".fcs"), multiple = TRUE)
    )
}