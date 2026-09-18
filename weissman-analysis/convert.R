library(readr)

input_dir <- "/Users/ludmanyboglarka/Documents/metalab/ROK_data_analysis/weissman-analysis/weissman-raw"
output_dir <- "/Users/ludmanyboglarka/Documents/metalab/ROK_data_analysis/weissman-analysis/output"
dir.create(output_dir, showWarnings = FALSE)

txt_files <- list.files(input_dir, pattern = "\\.txt$", full.names = TRUE)

for (f in txt_files) {
  df <- tryCatch({
    read.delim(f, skip = 4, header = TRUE, sep = "\t",
               strip.white = TRUE, na.strings = "None")
  }, error = function(e) {
    message("Failed on file: ", f, " — ", e$message)
    return(NULL)
  })
  
  if (!is.null(df)) {
    out_name <- file.path(output_dir, sub("\\.txt$", ".csv", basename(f)))
    write.csv(df, out_name, row.names = FALSE)
    message("Converted: ", basename(f))
  }
}
