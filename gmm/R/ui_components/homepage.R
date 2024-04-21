homepage <- function() {
  tabPanel("Home",
           fluidPage(
             titlePanel("GMM Data Processor"),
             
             sidebarLayout(
               sidebarPanel(
                 fileInput('plate_layout', 'Choose Plate Layout File:'),
                 fileInput('fcs_file', 'Choose FCS File:'),
                 fileInput('template_sheet', 'Choose Template Sheet File:'),
                 fileInput('primer_index', 'Choose Primer Index File:'),
                 actionButton("process", "Process Files"),
                 downloadButton("downloadData", "Download")
               ),
               
               mainPanel(
                 tableOutput("dataOutput")
               )
             )
           )
  )
}
