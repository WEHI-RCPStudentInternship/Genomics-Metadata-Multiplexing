# Prepare sample sheet for use with scPipe.R
# Peter Hickey
# Marek Cmero

# Setup ------------------------------------------------------------------------

library(here)
library(readxl)
library(dplyr)
library(janitor)

# Construct sample sheet ---------------------------------------------

spreadsheet <- "C094_SC_MB_NN215_Seqprimer19Mar21.xlsx"

# NOTE: Header row is split across 2 lines, which I combine into 1 before
#       reading in the rest of the spreadsheet.
header_row <- read_excel(
  path = spreadsheet,
  sheet = "Samples and indexing",
  skip = 2,
  n_max = 1, )

header_row <- paste0(colnames(header_row), header_row)
header_row <- gsub("^\\.\\.\\.[0-9]+", "", header_row)
sample_sheet <- read_excel(
  path = spreadsheet,
  sheet = "Samples and indexing",
  range = "A5:J388",
  # NOTE: Setting the max guess_max value avoids problems with incorrectly
  #       guessed columns
  #       (https://github.com/tidyverse/readxl/issues/414#issuecomment-352437730)
  guess_max = 1048576)
colnames(sample_sheet) <- header_row

# Tidy up names and empty rows/columns.
sample_sheet <- clean_names(sample_sheet)
sample_sheet <- remove_empty(
  sample_sheet,
  which = c("rows", "cols"))

# Filter out those wells that were removed.
sample_sheet <- sample_sheet %>%
  filter(!sample_type %in% c("empty", "HRP control"))

# Some final tidying.
sample_sheet <- sample_sheet %>%
  mutate(
    well_position = sapply(strsplit(well_position, "="), "[[", 1),
    well_position = factor(
      x = well_position,
      levels = unlist(
        lapply(LETTERS[1:16], function(x) paste0(x, 1:24)),
        use.names = TRUE)),
    # NOTE: Replace whitespace with '-'
    illumina_index_index_number_separate_index_read = sub(
      "PRI ",
      "PRI-",
      illumina_index_index_number_separate_index_read)) %>%
  arrange(plate_number, well_position)

# Construct final sample sheet -------------------------------------------------

# NOTE: Check that there aren't any malformed well_positions (e.g., 'I19=A1').
stopifnot(!anyNA(sample_sheet$well_position))

# Write sample sheet to disk ---------------------------------------------------

write.csv(sample_sheet, "sample_sheet.csv")
