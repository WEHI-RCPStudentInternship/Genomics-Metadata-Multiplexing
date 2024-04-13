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
    
    observe({
        # Initially set all dropbox areas as disabled
        disable("plateFile")
        disable("sampleSheet")
        disable("templateSheet")
        disable("fcsFiles")
        disable("indexFile")
        
        # Add 'disabled' class and remove 'enabled' class for all
        runjs('$("#plateFile").removeClass("enabled").addClass("disabled")')
        runjs('$("#sampleSheet").removeClass("enabled").addClass("disabled")')
        runjs('$("#templateSheet").removeClass("enabled").addClass("disabled")')
        runjs('$("#fcsFiles").removeClass("enabled").addClass("disabled")')
        runjs('$("#indexFile").removeClass("enabled").addClass("disabled")')
        
        # Enable and style dropbox areas based on the selected operation
        if (input$operation == "plateLayout") {
            enable("plateFile")
            runjs('$("#plateFile").removeClass("disabled").addClass("enabled")')
        } else if (input$operation == "collateFCS") {
            enable("fcsFiles")
            runjs('$("#fcsFiles").removeClass("disabled").addClass("enabled")')
        } else if (input$operation == "mergeDataSampleSheet") {
            enable("sampleSheet")
            enable("templateSheet")
            enable("fcsFiles")
            runjs('$("#sampleSheet").removeClass("disabled").addClass("enabled")')
            runjs('$("#templateSheet").removeClass("disabled").addClass("enabled")')
            runjs('$("#fcsFiles").removeClass("disabled").addClass("enabled")')
        } else if (input$operation == "mergeIndexFile") {
            enable("indexFile")
            enable("fcsFiles")
            runjs('$("#indexFile").removeClass("disabled").addClass("enabled")')
            runjs('$("#fcsFiles").removeClass("disabled").addClass("enabled")')
        }
    })
}
