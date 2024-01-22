import pandas as pd
import fcsparser

from shiny import App, render, ui
from pathlib import Path

"""

Uploading multiple fcs files
Parse by fcs_parser
Merge all files 
Show merged results
Download to csv file

"""

app_ui = ui.page_fluid(
    ui.input_file("fcs", "Choose multiple FCS files to upload:", accept=".fcs", multiple=True),
    ui.download_button("download_csv", "Download CSV file"),
    ui.output_table("table"),
)


def server(input, output, session):

    @output
    @render.table
    def table():
        df = pd.DataFrame()
        fcs_files = input.fcs()
        if not fcs_files:
            return pd.DataFrame()
        for i in range(len(fcs_files)):
            fcs_file_path = Path(fcs_files[i]["datapath"])
            _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
            df = pd.concat([df, raw_data])
        print(df.shape)
        return df
    
    # @session.download(filename="result.csv")
    @session.download(filename="merged.csv")
    def download_csv():
        df = pd.DataFrame()
        fcs_files = input.fcs()
        if not fcs_files:
            return pd.DataFrame()
        for i in range(len(fcs_files)):
            fcs_file_path = Path(fcs_files[i]["datapath"])
            _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
            df = pd.concat([df, raw_data])

        # Save the DataFrame to a CSV file in memory and yield the content
        csv_content = df.to_csv(index=False)
        yield csv_content

app = App(app_ui, server)
