pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  data_list <- lapply(files[id], read.csv)
  combined_data <- do.call(rbind, data_list)
  mean(combined_data[[pollutant]], na.rm = TRUE)
}