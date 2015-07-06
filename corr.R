corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        result <- c()
        all_files <- list.files(path=directory, full.names=T)
        
        for ( file_name in all_files){
	    	
	    	#path_to_file <- file.path(directory, paste(file_name,".csv", sep=""), fsep=.Platform$file.sep )
	#		print(path_to_file)
			#reads the data from the file
			#rm(airData)
			airData <- read.csv(file_name, header=T)
	        num_complete_cases <- dim(airData[complete.cases(airData),])[1]
	        if (num_complete_cases > threshold){
	        	
	        	correlation <- cor(airData$sulfate , airData$nitrate, use="complete.obs")
	        	result <- c(result, correlation)
	        }
	    	
        }
		
		return(result)
        
        
}
