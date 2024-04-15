

operations <- function() {
    
    tabPanel(
        'FCS Operations',
        value = "plateLayoutTab",
        sidebarPanel(
            h2("Select Operation Type"),
            selectInput("operation", "Choose an operation:",
                        choices=list("Choose..." = "",
                                     "Plate Layout to Spreadsheet" = "plateLayout",
                                     "Collate FCS Files" = "collateFCS",
                                     "Merge Data into Sample Sheet" = "mergeDataSampleSheet",
                                     "Merge Primer Index File" = "mergeIndexFile")),
            uiOutput("operationDetails"),  # Dynamic UI for operation details and file inputs
            actionButton("submitBtn", "Submit", class = "btn action-button disabled", disabled = TRUE)  # Initially disabled submit button
        ),
        mainPanel(

        )
    )
}
