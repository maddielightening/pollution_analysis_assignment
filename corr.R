corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  correlations <- numeric()
  
  for (file in files) {
    data <- read.csv(file)
    complete_cases <- complete.cases(data)
    num_complete_cases <- sum(complete_cases)
    
    if (num_complete_cases > threshold) {
      data_complete <- data[complete_cases, ]
      sulfate <- data_complete$sulfate
      nitrate <- data_complete$nitrate
      correlation <- cor(sulfate, nitrate, use = "complete.obs")
      correlations <- c(correlations, correlation)
    }
  }
  
  return(correlations)
}
