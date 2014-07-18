get.spot.table = function(filename) {
  
  library(stringr)
  
  fix.table = read.csv(file = filename)
  
  fix.table = fix.table[6:(length(fix.table[, 1])-1), ]
  fix.date = as.Date(as.character(fix.table[, 1]),format='%d/%m/%Y')
  fix.built = as.numeric(as.character(fix.table$X.1))
  fix.dwt = as.numeric(as.character(fix.table$X.2))
  fix.rate = as.numeric(as.character(fix.table$X.12))
  fix.duration = as.character(fix.table$X.14)
  
  fix.redel = toupper(as.character(fix.table$X.8))
  fix.redel = str_replace_all(fix.redel, ' - ', '-')
  fix.redel = str_replace_all(fix.redel, ' -', '-')
  fix.redel = str_replace_all(fix.redel, '- ', '-')
  fix.redel = str_replace_all(fix.redel, '  ', ' ')
  fix.redel = str_replace_all(fix.redel, 'CANAKKLE', 'CANAKKALE')
  fix.redel = str_replace_all(fix.redel, 'CARGILL', '')
  fix.redel = str_replace_all(fix.redel, 'JAPN', 'JAPAN')
  fix.redel = str_replace_all(fix.redel, 'EC SOUTH AMERICA', 'ECSA')
  fix.redel = str_replace_all(fix.redel, 'MALAYASIA', 'MALAYSIA')
  fix.redel = str_replace_all(fix.redel, 'MEDITERRANEAN', 'MED')
  fix.redel = str_replace_all(fix.redel, 'MEDIT', 'MED')
  fix.redel = str_replace_all(fix.redel, 'N CHINA', 'NORTH CHINA')
  fix.redel = str_replace_all(fix.redel, 'N JAPAN', 'NORTH JAPAN')
  fix.redel = str_replace_all(fix.redel, 'S.CHINA', 'SOUTH CHINA')
  fix.redel = str_replace_all(fix.redel, 'S.CHINA-TAIWAN', 'SOUTH CHINA-TAIWAN')
  fix.redel = str_replace_all(fix.redel, 'SKAW-CAPE PASS', 'SKAW-CAPE PASSERO')
  fix.redel = str_replace_all(fix.redel, 'SKAW-PASSERO', 'SKAW-CAPE PASSERO')
  fix.redel = str_replace_all(fix.redel, 'SOUTHEAST ASIA', 'SE ASIA')
  fix.redel = str_replace_all(fix.redel, 'SPANISH MEDIT', 'SPANISH MED')
  fix.redel = str_replace_all(fix.redel, 'UKCT', 'UKC')
  fix.redel = str_replace_all(fix.redel, 'US GULF', 'USG')
  fix.redel = str_replace_all(fix.redel, 'USGF', 'USG')
  fix.redel = str_replace_all(fix.redel, 'WORLD WIDE', 'WORLDWIDE')
  fix.redel = str_replace_all(fix.redel, 'EREGELI', 'EREGLI')
  fix.redel = str_replace_all(fix.redel, 'SAN CYPRIAN', 'SAN CIPRIAN')
  fix.redel = str_replace_all(fix.redel, 'SAUL', 'SUAL')
  fix.redel = str_replace_all(fix.redel, 'SEPTIBA', 'SEPETIBA')
  fix.redel = str_replace_all(fix.redel, 'SINGAPORE-J', 'SINGAPORE-JAPAN')
  fix.redel = str_replace_all(fix.redel, 'SKAW-CAPE PASSEROERO', 'SKAW-CAPE PASSERO')
  fix.redel = str_replace_all(fix.redel, 'CONT-MED', 'CONTINENT-MED')
  fix.redel = str_replace_all(fix.redel, 'SINGAPORE-JAPANAPAN', 'SINGAPORE-JAPAN')
      
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
                              redel = fix.redel, 
                              stringsAsFactors = FALSE)
  
  
  # for spot tables #
  fix.data.frame = fix.data.frame[which(fix.data.frame$rate > 100), -(5:6)]
  
  
  fix.data.frame = na.omit(fix.data.frame)
  # omit NAs
  fix.data.frame = fix.data.frame[which(fix.data.frame$rate != 0), ]
  # omit zero prices
  
  return(fix.data.frame)
  
}
