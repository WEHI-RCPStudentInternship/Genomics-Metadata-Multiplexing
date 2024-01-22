import pandas as pd
import fcsparser

from shiny import App, render, ui
from pathlib import Path

app_ui = ui.page_fluid(
    ui.input_file("fcs", "Choose an FCS file to upload:", accept=".fcs"),
    ui.download_button("download_csv", "Download CSV file"),
    ui.output_table("table"),
)


def server(input, output, session):

    @output
    @render.table
    def table():
        fcs_file = input.fcs()
        if not fcs_file:
            return pd.DataFrame()
        fcs_file_path = Path(fcs_file[0]["datapath"])
        _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
        df = pd.DataFrame(raw_data)

        return df
    
    # @session.download(filename="result.csv")
    @session.download(filename=lambda: f"{Path(input.fcs()[0]['name']).stem}.csv")
    def download_csv():
        fcs_file = input.fcs()
        if not fcs_file:
            return pd.DataFrame()
        fcs_file_path = Path(fcs_file[0]["datapath"])
        _, raw_data = fcsparser.parse(fcs_file_path, reformat_meta=True)
        df = pd.DataFrame(raw_data)
        # Save the DataFrame to a CSV file in memory and yield the content
        csv_content = df.to_csv(index=False)
        yield csv_content

app = App(app_ui, server)
