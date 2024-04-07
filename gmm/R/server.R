library(shiny)
library(shinyjs)

server <- function(input, output, session) {
    
    observeEvent(input$link_plateLayout, {
        updateTabsetPanel(session = session, inputId = "mainTabs", selected = "plateLayoutTab")
    })
    
    observeEvent(input$link_collateFCS, {
        updateTabsetPanel(session = session, inputId = "mainTabs", selected = "collateFCSTab")
    })
    
    observeEvent(input$link_mergeFCS, {
        updateTabsetPanel(session = session, inputId = "mainTabs", selected = "mergeFCSTab")
    })
    
}
