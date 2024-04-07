library(shiny)

# Updated Homepage TabPanel Content with Custom CSS
homepage <- tabPanel(
    'Home Page',
    tags$head(
        tags$style(HTML("
      h1 { font-size: 24px; font-family: 'Georgia', serif; }
      h2 { font-size: 20px; font-family: 'Georgia', serif; }
      p { font-size: 11px; font-family: 'Georgia', serif; }
      .homepage-content { padding: 20px; }
    "))
    ),
    div(
        class = 'homepage-content',
        tags$h1('Welcome to the WEHI Genomics Metadata Multiplexing Project'),
        tags$p('The Genomics Metadata Multiplexing (GMM) project represents a collaborative effort to automate critical aspects of the CEL-Seq2 workflow in genomics research. Initially developed as a Flask application by Marek Cmero, this project has now transitioned to a Shiny/R web application to leverage the computational resources of the WEHI Milton server.'),
        
        tags$h2('Main Purpose'),
        tags$p('This web application is designed to streamline the integration of FCS file data with experiment-specific Index Primer spreadsheets. By automating the merge process, the GMM project aims to enhance the accuracy and efficiency of genomic experiments conducted at WEHI.'),
        
        tags$h2('Key Functionalities'),
        tags$ul(
            tags$li('Plate Layout to Spreadsheet: Converts colour-coded plate designs into row-wise spreadsheets, detailing sample IDs for each well.'),
            tags$li('Collate FCS Data: Merges data from multiple FCS files into a single comprehensive CSV file.'),
            tags$li('Merge FCS Data: Integrates FACS data into a row-wise sample spreadsheet, correlating plate, sample ID, and well position.')
        ),
        
        tags$h2('Navigating the Application'),
        tags$p('Access to the application’s functionalities is through distinct pages within this web app. Users can navigate to:'),
        tags$ul(
            tags$li(tags$a(href = '#', 'Plate Layout to Spreadsheet'), ': Generate sample spreadsheets from plate designs.'),
            tags$li(tags$a(href = '#', 'Collate FCS Data'), ': Aggregate FCS file data.'),
            tags$li(tags$a(href = '#', 'Merge FCS Data'), ': Merge FCS and Index Primer data into experiment spreadsheets.')
        ),
        
        tags$h2('Deployment and Future Directions'),
        tags$p('With the shift to Shiny/R and deployment on the WEHI Milton server, the GMM project is poised for further development and refinement. This transition not only facilitates access to powerful computational resources but also aligns with our goal of internalizing the application to minimize external costs and enhance data security.'),
        
        tags$h2('Acknowledgements'),
        tags$p('We extend our deepest gratitude to all the interns, open source contributors, and supervisory staff who have contributed to the GMM project. Special thanks to Marek Cmero for his foundational work on the initial Flask application.')
    )
)
