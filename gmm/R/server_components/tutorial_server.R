tutorialServer <- function(input, output, session) {
    # Dynamically update the tutorial title and content based on the selected tutorial
    output$tutorialTitle <- renderText({
        switch(input$tutorialChoice,
               "intro" = "Introduction to Genomics Metadata Multiplexing",
               "dataPrep" = "Preparing Your Data for Analysis",
               "analysis" = "Analyzing Your Data",
               "results" = "Interpreting the Results",
               "Select a tutorial to get started")  # Default message
    })
    
    output$tutorialOutput <- renderUI({
        switch(input$tutorialChoice,
               "intro" = {
                   tagList(
                       h4("Welcome to the Genomics Metadata Multiplexing Project!"),
                       p("This tutorial will guide you through the basics of genomics metadata multiplexing..."),
                       # Additional content here
                   )
               },
               "dataPrep" = {
                   tagList(
                       h4("Data Preparation"),
                       p("Before you can analyze your data, it needs to be properly prepared. This tutorial will show you how..."),
                       # Additional content here
                   )
               },
               # Add cases for other tutorials as needed
        )
    })
}