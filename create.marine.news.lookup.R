create.marine.news.lookup = function() {
  
  
  marine.news.table.new = get.marine.news.prices()
  load('port_directory.table')
  
  
  marine.news.table.new.lookup = list()
  length(marine.news.table.new.lookup) = 
    length(marine.news.table.new$port)
  
  for (i in 1:length(marine.news.table.new$port)) {
    lookup.value = which(port_directory.table$port == marine.news.table.new$port[i])
    if (!(length(lookup.value) == 0)) {
      marine.news.table.new.lookup[[i]] = lookup.value
    } else {
      marine.news.table.new.lookup[[i]] = NA
    }
  }
  
  #   bunkerportsnews.table.new.lookup
  #   
  #   which(sapply(bunkerportsnews.table.new.lookup, length) > 1)
  #   which(sapply(bunkerportsnews.table.new.lookup, 
  #                function(x) {ifelse(length(x) == 1, 
  #                                    yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
  #                                    no = FALSE)}) == 1)
  
  marine.news.lookup = vector('numeric',
                              length(marine.news.table.new.lookup))
  
  for (i in 1:length(marine.news.table.new.lookup)) {
    if (length(marine.news.table.new.lookup[[i]]) > 1) {
      marine.news.lookup[i] = 9999
    } else if (is.na(marine.news.table.new.lookup[[i]])) {
      marine.news.lookup[i] = 0
    } else {
      marine.news.lookup[i] = marine.news.table.new.lookup[[i]]
    }
  }
  
  sum(marine.news.lookup == 0)
  which(marine.news.lookup == 0)
  marine.news.table.new$port[which(marine.news.lookup == 0)]
  sum(marine.news.lookup == 9999)
  which(marine.news.lookup == 9999)
  marine.news.table.new$port[which(marine.news.lookup == 9999)]
  
  
  marine.news.lookup[which(marine.news.table.new$port == 'Sydney-AUS')] = 
    which(port_directory.table$port == 'Sydney' & port_directory.table$country == 'Australia')
  marine.news.lookup[which(marine.news.table.new$port == 'Freeport (Bahamas)')] = 
    which(port_directory.table$port == 'Freeport' & port_directory.table$country == 'Bahamas')
  marine.news.lookup[which(marine.news.table.new$port == 'St Petersburg')] = 
    which(port_directory.table$port == 'St Petersburg' & port_directory.table$country == 'Russia')
  marine.news.lookup[which(marine.news.table.new$port == 'Sydney-AUS')] = 
    which(port_directory.table$port == 'La Libertad' & port_directory.table$country == 'Ecuador')
  marine.news.lookup[which(marine.news.table.new$port == 'Puerto Bolivar')] = 
    which(port_directory.table$port == 'Puerto Bolivar' & port_directory.table$country == 'Ecuador')
  
  
  ###
  ###  
  
#   c1 = as.character(bunkerportsnews.table.new$port)
#   c2 = as.character(port_directory.table$port[bunkerportsnews.lookup])
#   c3 = as.character(port_directory.table$country[bunkerportsnews.lookup])
#   c4 = port_directory.table$longitude[bunkerportsnews.lookup]
#   c5 = port_directory.table$latitude[bunkerportsnews.lookup]
#   c6 = na.omit(data.frame(
#     port = c1, pd.port = c2, pd.country = c3, 
#     longitude = c4, latitude = c5, stringsAsFactors = FALSE))
#   
#   bunkerportsnews.lookup = c6
#   save(bunkerportsnews.lookup, file = 'bunkerportsnews.lookup')
  
marine.news.lookup = 
  data.frame(marine.news.port = marine.news.table.new$port, 
             pd.line = marine.news.lookup, 
             stringsAsFactors = FALSE)

return(marine.news.lookup)
  
}