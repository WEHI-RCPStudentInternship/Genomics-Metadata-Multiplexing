homepage <- function() {
  tabPanel(
    "Genomics Metadata Multiplexing Project",

    div(
      class = 'homepage-content',
      shinyjs::useShinyjs(), # Initialize shinyjs
      h2('Welcome to the WEHI Genomics Metadata Multiplexing Project'),
      p('The Genomics Metadata Multiplexing (GMM) project is an ambitious initiative aimed at enhancing genomic research efficiency through automation and data integration. This project specifically focuses on the CEL-Seq2 workflow, a crucial process in genomic experiments that involves the meticulous preparation and analysis of cellular samples.'),
      p('Originally developed as a Flask application by Marek Cmero, a Senior Research Officer at WEHI, the project has transitioned to Shiny/R to leverage the advanced computational resources and interactive capabilities offered by the R ecosystem. This migration ensures a seamless user experience and integrates perfectly with the existing workflows at WEHI.'),
      h3('Main Purpose'),
      p('The core objective of this web application is to automate the integration of FCS file data with Index Primer spreadsheets. This automation is critical for streamlining the data preparation process, reducing manual errors, and significantly enhancing the accuracy and efficiency of genomic experiments.'),
      h3('Key Functionalities'),
      tags$ul(
        tags$li(p(actionLink("link_plateLayout", "Plate Layout to Spreadsheet"), ": A tool to convert color-coded plate designs into a row-wise spreadsheet, outlining sample IDs for each well.")),
        tags$li(p(actionLink("link_collateFCS", "Collate FCS Data"), "A feature that aggregates data from multiple FCS files into a single, comprehensive CSV file.")), 
        tags$li(p(actionLink("link_mergeFCS", "Merge FCS Data"), "An application to integrate FACS data into a row-wise sample (experiment) spreadsheet, correlating plate, sample ID, and well position.")),
      ),
      h3('Navigating the Application'),
      p('This web application is structured into distinct pages, each dedicated to one of the functionalities mentioned above. Users can navigate between these pages using the links provided on the homepage or the navigation bar at the top of the application.'),
      h3('Deployment and Future Directions'),
      p('With its transition to Shiny/R and deployment on the WEHI Milton server, the GMM project is set for further development and enhancements. This strategic move not only aligns with the project’s goals of improving genomic research methodologies but also significantly reduces external computational costs.'),
      h3('Acknowledgements'),
      p('The GMM project owes its success to the collective efforts of interns, open source contributors, and supervisory staff at WEHI. We extend our heartfelt gratitude to everyone involved, with special thanks to Marek Cmero for his pioneering work and dedication to the project.')
    )
  )
}
