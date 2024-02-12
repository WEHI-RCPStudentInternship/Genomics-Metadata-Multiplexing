
library(shiny)
library(reticulate)

#py_config()

#fcsparser <- import("fcsparser")
#fk <- import("flowkit")

source_python("python_functions.py")

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Uploading Files"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ----
      fileInput("file1", "Choose FCS File",
                multiple = TRUE,
                accept = ".fcs"),
      
      # Horizontal line ----
      tags$hr(),
      
      # select
      selectInput("mySelect", "Choose a format:", choices = c("Scale values", "Channel values"), selected = "Scale values"),
      verbatimTextOutput("selectedOption"),
      
      # Horizontal line ----
      tags$hr(),
      
      # Button
      h5("Download as CSV file"),
      downloadButton("downloadData1", "Download CSV Scale values", style = "vertical-align: middle; width: 80%;"),
      downloadButton("downloadData2", "Download CSV Channel values", style = "vertical-align: middle; width: 80%;")
      ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      # Output: Data file ----
      tableOutput("contents")
      )
  )
)


# Define server logic required to draw a histogram ----
server <- function(input, output) {
  contents1 <- reactive({
    req(input$file1)
    df <- data.frame()
    for (i in seq_along(input$file1$name)) {
      filepath <- input$file1$datapath[i]
      new <- scale_value(filepath)
      df <- rbind(df, new)
    }
    df
  })
  contents2 <- reactive({
    req(input$file1)
    df <- data.frame()
    for (i in seq_along(input$file1$name)) {
      filepath <- input$file1$datapath[i]
      new <- channel_value(filepath)
      df <- rbind(df, new)
    }
    df
  })
  
  # Render the table based on the selected option
  output$contents <- renderTable({
    if (input$mySelect == "Scale values") {
      return(contents1())
    } else {
      return(contents2())
    }
  }, digits = 5)
  
  # download scale
  output$downloadData1 <- downloadHandler(
    filename = function() {
      paste("merged_scale.csv", sep = "")
    },
    content = function(file) {
      write.csv(contents1(), file, row.names = FALSE)
    }
  )
  
  # download channel
  output$downloadData2 <- downloadHandler(
    filename = function() {
      paste("merged_channel.csv", sep = "")
    },
    content = function(file) {
      write.csv(contents2(), file, row.names = FALSE)
    }
  )
}

shinyApp(ui = ui, server = server)
