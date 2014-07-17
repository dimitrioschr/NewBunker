get.spot.table = function(filename) {
  
  library(stringr)
  
  fix.table = read.csv(file = filename)
  
  fix.table = fix.table[6:(length(fix.table[, 1])-1), ]
  fix.date = as.Date(as.character(fix.table[, 1]),format='%d/%m/%Y')
  fix.built = as.numeric(as.character(fix.table$X.1))
  fix.dwt = as.numeric(as.character(fix.table$X.2))
  fix.rate = as.numeric(as.character(fix.table$X.12))
  fix.duration = as.character(fix.table$X.14)
  fix.is.years = str_detect(fix.duration, 'ear')
  fix.is.months = str_detect(fix.duration, 'ont')
  fix.is.days = str_detect(fix.duration, 'ay')
  fix.is.range = str_detect(fix.duration, '-')
  fix.duration = str_extract(fix.duration, '[0-9]*-*[0-9]*')
  fix.duration.min = vector(mode = 'numeric', length = length(fix.duration))
  fix.duration.max = vector(mode = 'numeric', length = length(fix.duration))
  for (i in 1:length(fix.duration)) {
    fix.duration.min[i] = as.numeric(unlist(str_split(fix.duration[i], '-'))[1])
    fix.duration.max[i] = as.numeric(unlist(str_split(fix.duration[i], '-'))[2])
  }
  fix.duration.max[which(!fix.is.range)] = 
    fix.duration.min[which(!fix.is.range)]
  fix.factor = fix.is.days / 30 + fix.is.months * 1 + fix.is.years * 12
  
  
  fix.data.frame = data.frame(date = fix.date, 
                              built = fix.built, 
                              dwt = fix.dwt, 
                              rate = fix.rate, 
                              duration.min = fix.duration.min * fix.factor, 
                              duration.max = fix.duration.max * fix.factor, 
                              stringsAsFactors = FALSE)
  
  
  # for spot tables #
  fix.data.frame = fix.data.frame[which(fix.data.frame$rate > 100), 1:4]
  
  
  fix.data.frame = na.omit(fix.data.frame)
  # omit NAs
  fix.data.frame = fix.data.frame[which(fix.data.frame$rate != 0), ]
  # omit zero prices
  
  return(fix.data.frame)
  
}
