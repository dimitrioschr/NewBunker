get.fleet.table = function(filename) {
  
  fleet.table = read.csv(file = filename)
  fleet.table = fleet.table[6:(length(fleet.table[, 1])-1), ]
  dwt = as.numeric(as.character(fleet.table$X.4))
  built = as.numeric(as.character(fleet.table$X.7))
  flag = as.character(fleet.table$X.6)
  return(data.frame(dwt = dwt, 
                    built = built, 
                    flag = flag, 
                    stringsAsFactors = FALSE))
  
}