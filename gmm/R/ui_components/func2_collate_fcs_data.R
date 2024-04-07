func2_collate_fcs_data  <- function() {
    tabPanel(
        'Collate FCS data',
        value = "collateFCSTab",
        sidebarPanel(
            h2("Collate FCS Data"),
            p("The Collate FCS Data functionality merges data from multiple FCS files into a single CSV file. This aggregated data can then be used for further analysis or operations within the application. Start by uploading your FCS files below.")
        ),
        mainPanel(
            # Operation UI elements will be added here
        )
    )
}
