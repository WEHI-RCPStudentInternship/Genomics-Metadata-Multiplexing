library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    output$distPlot <- renderPlot({
        # Generate bins based on input$bins from ui.R
        x <- faithful[, 2]  # Extracting the waiting times between eruptions
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # Draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}
