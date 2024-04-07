func1_plate_to_spreadsheet <- function() {
    tabPanel(
        'Plate to Spreadsheet',
        value = "plateLayoutTab",
        sidebarPanel(
            h2("Plate Layout to Spreadsheet Conversion"),
            p("This function allows users to convert color-coded plate designs into a comprehensive row-wise spreadsheet, detailing sample IDs for each well position. Upload your plate design file below to begin the conversion process.")
        ),
        mainPanel(
            # Operation UI elements will be added here
        )
    )
}
