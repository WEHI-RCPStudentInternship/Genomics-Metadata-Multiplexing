# In homepage.R
func3_merge_fcs_data <- tabPanel(
    'Merge FCS data',
    sidebarPanel(
        h3("Merge FCS Data"),
        p("This feature integrates FACS data into a row-wise sample (experiment) spreadsheet, correlating plate, sample ID, and well position. It's a crucial step in automating the data preparation process for genomic experiments. Upload your FCS and Index Primer files to proceed.")
    ),
    mainPanel(
        # Operation UI elements will be added here
    )
)
