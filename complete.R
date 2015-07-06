complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        nobs=c()
        for ( f in id){
        	file_name <-as.character(f)
       		if (f < 10){
       		file_name <- paste("00",file_name,sep="")
		    }
       		else if (f < 100){
		       file_name <- paste("0",file_name,sep="")
	       
	    	}
	    	
	    	path_to_file <- file.path(directory, paste(file_name,".csv", sep=""), fsep=.Platform$file.sep )
			print(path_to_file)
			#reads the data from the file
			#rm(airData)
			airData <- read.csv(path_to_file, header=T)
	        nobs <- c(nobs, dim(airData[complete.cases(airData),])[1])
	    	
        }
        
        return(data.frame(id,nobs))        
}
