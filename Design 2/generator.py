import pandas as pd
import os
import openpyxl

def merge_xlsx_files_in_folder(folder_path):
    # Initialize an empty DataFrame
    merged_dataframe = pd.DataFrame()

    # Loop through each file in the folder
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            # Check if the file has the ".xlsx" extension
            if file.endswith(".xlsx"):
                xlsx_file_path = os.path.join(root, file)
                print("Merging:", xlsx_file_path)

                # Read all sheets from the XLSX file into a dictionary of DataFrames
                sheets_dict = pd.read_excel(xlsx_file_path, sheet_name=None)

                # Loop through each sheet in the dictionary
                for sheet_name, df in sheets_dict.items():
                    # Append the DataFrame to the merged_dataframe
                    merged_dataframe = pd.concat([merged_dataframe, df], ignore_index=True)

    return merged_dataframe

def save_to_excel_noHeader(dataframe, output_folder):
    # Create the output folder if it doesn't exist
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Specify the output Excel file path
    output_xlsx_file = os.path.join(output_folder, "merged_data.xlsx")

    # Create a Pandas Excel writer using openpyxl engine
    writer = pd.ExcelWriter(output_xlsx_file, engine='openpyxl')

    # Write the DataFrame to the Excel sheet
    dataframe.to_excel(writer, sheet_name='Merged Data', index=False)

    # Save the Excel file
    writer.save()

    print("Merged data saved to Excel file:", output_xlsx_file)

# On progress: extra functioanality for adding customise header 
def save_to_excel(dataframe, output_folder, header_name):
    # Create the output folder if it doesn't exist
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Insert a new row at the beginning of the DataFrame for the header
    header_row = pd.DataFrame({dataframe.columns[0]: [header_name]})
    #dataframe = pd.concat([header_row, dataframe], ignore_index=True)
    dataframe = pd.concat([header_row,dataframe.loc[:]]).reset_index(drop=True)

    # Specify the output Excel file path
    output_xlsx_file = os.path.join(output_folder, "merged_data.xlsx")

    # Create a Pandas Excel writer using openpyxl engine
    writer = pd.ExcelWriter(output_xlsx_file, engine='openpyxl')

    # Write the DataFrame to the Excel sheet
    dataframe.to_excel(writer, sheet_name='Merged Data', index=False)

    # Save the Excel file
    writer.save()

    print("Merged data saved to Excel file:", output_xlsx_file)

if __name__ == "__main__":

    # Get user input and output for the folder path
    input_folder_path = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Data/Flowjo"
    output_folder_path = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Design 2"

    # Merge the XLSX files in the folder
    merged_data = merge_xlsx_files_in_folder(input_folder_path)

    # Specify the output folder
    output_folder = os.path.join(output_folder_path, "Merged Output")

    # Path to Primer Index Template
    template_xlsx_path = "/Users/andylenguyen/Documents/Genomics-Metadata-Multiplexing/Primer Index Template/primerindex_temp.xlsx"
    
    # Read the extra Excel file
    extra_data = pd.read_excel(template_xlsx_path)

    # Merge the extra data with the previously merged data
    final_merged_data = pd.concat([extra_data, merged_data], ignore_index=True)

    # Specify the output folder
    output_folder = os.path.join(output_folder_path, "Merged Output")

    # Get user input for adding header
    isHeader = input("Do you need a header [yes/no]: ")
    if isHeader == "yes":
        print("yes")
        add_header = input("Enter the header name: ")
        # Save the merged data to an Excel file
        save_to_excel(final_merged_data, output_folder, add_header)
    elif isHeader == "no":
        print("no")
        save_to_excel_noHeader(final_merged_data, output_folder)
