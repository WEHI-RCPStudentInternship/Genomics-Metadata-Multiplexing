tutorial <- function() {
    tabPanel(
        'Tutorial',
        tags$head(
            tags$style(HTML("
        * {font-family: 'Roboto'; }
        h1, h2, h3 { font-family: 'Georgia', serif; }
        h2 { font-size: 20px; }
        h3 { font-size: 16px; }
        p { font-size: 11px; }
        .homepage-content { padding-bottom: 1rem;}
        ul { padding-left: 0; }
        li { margin-left: 14px; }
      "))
        ),
        div(
            class = 'homepage-content',
            shinyjs::useShinyjs(), # Initialize shinyjs
            tags$h2('Tutorial')
        )
    )
}
