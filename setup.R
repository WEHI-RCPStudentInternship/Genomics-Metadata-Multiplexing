packages <- c("DT", "shinycssloaders", "reticulate", "shiny", "RColorBrewer", "shinyjs", "shinythemes", "shinyalert")
newPackages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(newPackages)) install.packages(newPackages)