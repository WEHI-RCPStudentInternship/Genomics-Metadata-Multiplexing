homepage_info <- function() {
    tags$div(
        h2("Celseq2 FCS Data Processor"),
        p("This dashboard executes a series of operations designed to streamline data processing and analysis for the Genomics Metadata Multiplexing Project. This dashboard will streamline four operations to handle different input files."),
        tags$ul(
            tags$li(
                div(
                    h5("Operation 1: Create Sample Sheet from Plate Layout", style = "font-weight: bold;"),
                    tags$b("Purpose:"), " Converts the provided 'Plate Layout' sheet into a detailed sample sheet. This process involves translating the information from an excel file, which includes colored plate information, into a structured format.",
                    br(),
                    actionLink("viewOp1", "See sample Template file"),
                    br(),
                    tags$b("Output:"), " A sample sheet containing the following columns: plate number, well position, sample name."
                )
            ),
            tags$li(
                div(
                    h5("Operation 2: Combine FCS Files into One Document", style = "font-weight: bold;"),
                    tags$b("Purpose:"), " Merges multiple FCS files into a single TSV (Tab Separated Values) file using a vertical merge principle. This operation is essential for consolidating flow cytometry data.",
                    br(),
                    tags$b("Output:"), " A single TSV file containing merged data from all provided FCS files."
                )
            ),
            tags$li(
                div(
                    h5("Operation 3: Merge All Data into One Comprehensive File", style = "font-weight: bold;"),
                    tags$b("Purpose:"), " Integrates the sample sheet from Operation 1, a template sheet provided by the lab, and the FCS results from Operation 2 into a unified document. This operation facilitates comprehensive data analysis by combining all relevant data points.",
                    br(),
                    actionLink("viewOp3", "See sample Template file"),
                    br(),
                    tags$b("Output:"), " A single file that merges the aforementioned documents based on plate number, well position, and sample name."
                )
            ),
            tags$li(
                div(
                    h5("Operation 4 (Optional): Add Primer Index to Comprehensive File", style = "font-weight: bold;"),
                    tags$b("Purpose:"), " (Optional) Enhances the comprehensive file from Operation 3 by adding Primer Index information provided by the lab. This step is optional but recommended for more detailed analysis.",
                    br(),
                    actionLink("viewOp4", "See sample Primer Index file")
                )
            )
        ),
        tags$div(
            tags$li(
                "For more project information, please visit the ",
                a("Genomics Metadata Multiplexing GitHub", href = "https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing"),
                "."
            ),
            tags$li(
                "Project wiki: ",
                a("WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki", href = "https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki")
            )
        ),
        style = "padding: 20px;"
    )
}