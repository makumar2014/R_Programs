pollutantmean <- function(directory, pollutant="sulfate", id=1:332) {
    # Get current directory
    current_dir = getwd()
    
    # Move to the directory specified
    setwd(directory)
    
    # Read the file names in a character vector
    file_names <- dir()

    # Initialize variables
    sulfate_sum <- 0
    sulfate_count <- 0
    
    nitrate_sum <- 0
    nitrate_count <- 0

    # Loop based on id
    for(x in id) {
        
        # Use the file names to read a file into a data frame
        PM_Values <- read.csv(file_names[x], header=TRUE)
        
        sulfate_sum <- sum(PM_Values$sulfate, na.rm = TRUE) + sulfate_sum
        sulfate_count <- sum(!is.na(PM_Values$sulfate)) + sulfate_count
        
        nitrate_sum <- sum(PM_Values$nitrate, na.rm = TRUE) + nitrate_sum
        nitrate_count <- sum(!is.na(PM_Values$nitrate)) + nitrate_count
    }

    # change back to original directory
    setwd(current_dir)

    # return the correct mean. Default is sulfate
    if (pollutant=="nitrate") {
        return(nitrate_sum/nitrate_count)    
        }
    else {
        return(sulfate_sum/sulfate_count)
    }    

}