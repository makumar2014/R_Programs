complete <- function(directory, id=1:332) {
    # Get current directory
    current_dir = getwd()
    
    # Move to the directory specified
    setwd(directory)
    
    # Read the file names in a character vector
    file_names <- dir()
    
    # Initialize variables
    nobs <- vector("integer", length=length(id))
    nobs_index <- 1L
    df<-data.frame(id, nobs)    

    # Loop based on id
    for(x in id) {
        # Use the file names to read a file into a data frame
        PM_Values <- read.csv(file_names[x], header=TRUE)
        nobs_PM_Values <- complete.cases(PM_Values)
        nobs[nobs_index] <- sum(nobs_PM_Values)
        nobs_index <- nobs_index + 1
    }
    
    # create the data frame
    df <- cbind.data.frame(id, nobs)
    # print(df)

    # return back to original directory
    setwd(current_dir)
    
    return(df)
}