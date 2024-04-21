library(reticulate)
use_virtualenv("./venv", required = TRUE)
py_run_string("import sys; print(sys.version)")

homePageServerHandler <- function(input, output, session) {
    
    outputFilePath <- reactiveVal() # To store the path of the processed file
    
    observeEvent(input$process, {
        req(input$plate_layout, input$fcs_file, input$template_sheet, input$primer_index) # Ensure all files are uploaded
        
        # Setup Python environment using reticulate
        venvDir <- "path/to/your/venv" # Specify the path where you want the virtual environment to be
        requirementsPath <- "requirements.txt" # Adjust the path to your requirements.txt if necessary
        
        # Create or activate the virtual environment
        virtualenv_create(venvDir, python = "auto")
        virtualenv_install(venvDir, requirements = requirementsPath)
        use_virtualenv(venvDir, required = TRUE)
        
        # Store uploaded files in a temporary directory
        tempDir <- tempdir()
        plate_layout_path <- input$plate_layout$datapath
        fcs_file_path <- input$fcs_file$datapath
        template_sheet_path <- input$template_sheet$datapath
        primer_index_path <- input$primer_index$datapath
        
        # Define the output file path
        output_file_path <- file.path(tempDir, "processed_output.csv") # Change to .tsv if needed
        outputFilePath(output_file_path) # Store the output file path for download
        
        # Call the Python script with the provided files
        scriptPath <- "path/to/fcs_converter.py" # Adjust the path to your Python script
        py_run_string(sprintf("import subprocess; subprocess.run(['python', '%s', '--plate-layout', '%s', '--fcs-file', '%s', '--template-sheet', '%s', '--primer-index', '%s', '--output-file', '%s'], check=True)", scriptPath, plate_layout_path, fcs_file_path, template_sheet_path, primer_index_path, output_file_path))
        
        # Read the output file into a data frame and make it available for rendering
        outputData <- tryCatch({
            read.csv(output_file_path)
        }, error = function(e) {
            NULL # In case of error reading the file, return NULL
        })
        output$dataOutput <- renderTable({
            outputData
        })
    })
    
    # Allow the user to download the processed file
    output$downloadData <- downloadHandler(
        filename = function() {
            "processed_output.csv" # or "processed_output.tsv"
        },
        content = function(file) {
            file.copy(outputFilePath(), file)
        }
    )
}
