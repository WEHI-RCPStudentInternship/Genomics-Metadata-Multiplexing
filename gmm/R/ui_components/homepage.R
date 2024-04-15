homepage <- function() {
  tabPanel(
    title="Genomics Metadata Multiplexing Project",
    
    div(
      class = 'homepage-content',
      h2('Welcome to the WEHI Genomics Metadata Multiplexing Project'),
      p('The Genomics Metadata Multiplexing (GMM) project, hosted by WEHI, focuses on automating aspects of the CEL-Seq2 workflow, particularly the integration of FCS file data with Index Primer spreadsheets. This initiative aims to enhance genomic research efficiency through improved data handling and analysis.'),
      p('For a more comprehensive overview of the project, including its current objectives, essential wiki pages, and more, visit the ', 
        a('GMM project wiki page', href="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/", target="_blank"), 
        '.'),
      p('To explore the web application developed as part of this project, refer to the ', 
        a('GMM project page', href="https://wehi-researchcomputing.github.io/student-genomics-metadata.html", target="_blank"), 
        '.'),
      
      h3('Key Operations of the GMM Project'),
      tags$ul(
        tags$li('Plate Layout to Spreadsheet: This function handles the conversion of a plate layout to sample sheet.'),
        tags$li('Plate Layout to Spreadsheet: Converts color-coded plate designs into a row-wise spreadsheet, detailing sample IDs for each well.'),
        tags$li('Collate FCS Data: Aggregates data from multiple FCS files into a single, comprehensive CSV file for easier analysis.'),
        tags$li('Merge FCS Data: Integrates FACS data into a row-wise sample (experiment) spreadsheet, correlating plate, sample ID, and well position.'),
      ),
      
      h3('About CEL-Seq2 and the Need for Automation'),
      p('CEL-Seq2 is a single-cell RNA sequencing protocol that plays a critical role in genomic experiments. The GMM project seeks to automate the manual and time-consuming process of merging FCS files with Index Primer spreadsheets, a task essential for the accurate preparation and analysis of cellular samples.'),
      
      h3('The Role of the Web Application'),
      p('The web application developed by the GMM project serves to automate the merge process between FCS files and Index Primer spreadsheets, streamlining data preparation and enhancing the accuracy of genomic experiments. This tool is designed to be intuitive and accessible to researchers, facilitating seamless integration into existing workflows.'),
      
      h3('Project Contributions and Acknowledgements'),
      p('This project is a collaborative effort involving interns, open source contributors, and supervisory staff at WEHI. Special thanks to Marek Cmero for his pioneering work and dedication. The collective efforts of all involved have been instrumental in the project’s success.'),
      
      h3('Further Reading and Resources'),
      tags$ul(
        tags$li(a("GMM Project Overview", href="https://wehi-researchcomputing.github.io/student-genomics-metadata.html", target="_blank")),
        tags$li(a("GMM GitHub Wiki", href="https://github.com/WEHI-ResearchComputing/Genomics-Metadata-Multiplexing/wiki/", target="_blank"))
      )
    )
  )
}