tutorial <- function() {
    tabPanel(
        'Tutorial',
        value = "tutorialTab",
        sidebarPanel(
            h2("Tutorial"),
            p("This section provides a comprehensive guide and tutorials related to the Genomics Metadata Multiplexing Project."),
            selectInput("tutorialChoice", "Choose a tutorial:",
                        choices = list("Introduction" = "intro",
                                       "Data Preparation" = "dataPrep",
                                       "Analysis" = "analysis",
                                       "Results Interpretation" = "results")),
            actionButton("startTutorial", "Start Tutorial", class = "btn action-button")
        ),
        mainPanel(
            h3(textOutput("tutorialTitle")),
            div(id = "tutorialContent",
                # Placeholder for tutorial content
                # Dynamic UI elements will be rendered based on the tutorial choice
                uiOutput("tutorialOutput")
            )
        )
    )
}

