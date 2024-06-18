complete <- function(directory, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  results <- data.frame(id = integer(), nobs = integer())
  
  for (i in id) {
    data <- read.csv(files[i])
    complete_cases <- sum(complete.cases(data))
    results <- rbind(results, data.frame(id = i, nobs = complete_cases))
  }
  
  return(results)
}
