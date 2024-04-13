customFileInput <- function(inputId, label, accept=NULL, multiple=FALSE, icons=NULL) {
    div(class = "file-input-wrapper",  # This div wraps the file input and allows for custom styling
        div(class = "dropbox-area enabled", # Use the 'enabled' state by default
            fileInput(inputId, label, accept = accept, multiple = multiple),
            div(class = "icons-overlay",
                lapply(icons, function(icon) {
                    tags$img(src = icon, class = "file-icon")
                })
            ),
            style = "position: relative; height: 150px;" # Ensure the container has a fixed height
        )
    )
}
