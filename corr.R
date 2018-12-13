corr <- function(directory, threshold=0) {

    # Get current directory
    current_dir = getwd()
    
    # Move to the directory specified
    setwd(directory)
    
    # Read the file names in a character vector
    file_names <- dir()
    num_files <- length(file_names)
    
    # Initialize variables
    index <- 1L
    result <- vector("numeric")
    
    # Loop through all the files
    for(x in 1:num_files) {
        # Use the file names to read a file into a data frame
        PM_Values <- read.csv(file_names[x], header=TRUE)
        
        # Check if complete cases is > threshold
        if(sum(complete.cases(PM_Values))>threshold) {
            
            # Calculate correlation of Sulfate and Nitrate readings
            result[index] <- cor(PM_Values$sulfate, PM_Values$nitrate, use="complete.obs")
            index <- index + 1
        }
    }
    
    # return back to original directory
    setwd(current_dir)
    
    # return the result numeric vector
    return(result)
}