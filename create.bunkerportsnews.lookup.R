create.bunkerportsnews.lookup = function() {
  
  
  bunkerportsnews.table.new = get.bunkerportsnews.prices.from.table()
  load('port_directory.table')
  
  
  bunkerportsnews.table.new.lookup = list()
  length(bunkerportsnews.table.new.lookup) = 
    length(bunkerportsnews.table.new$port)
  
  for (i in 1:length(bunkerportsnews.table.new$port)) {
    lookup.value = which(port_directory.table$port == bunkerportsnews.table.new$port[i])
    if (!(length(lookup.value) == 0)) {
      bunkerportsnews.table.new.lookup[[i]] = lookup.value
    } else {
      bunkerportsnews.table.new.lookup[[i]] = NA
    }
  }
  
  #   bunkerportsnews.table.new.lookup
  #   
  #   which(sapply(bunkerportsnews.table.new.lookup, length) > 1)
  #   which(sapply(bunkerportsnews.table.new.lookup, 
  #                function(x) {ifelse(length(x) == 1, 
  #                                    yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
  #                                    no = FALSE)}) == 1)
  
  bunkerportsnews.lookup = vector('numeric', 
                                  length(bunkerportsnews.table.new.lookup))
  
  for (i in 1:length(bunkerportsnews.table.new.lookup)) {
    if (length(bunkerportsnews.table.new.lookup[[i]]) > 1) {
      bunkerportsnews.lookup[i] = 9999
    } else if (is.na(bunkerportsnews.table.new.lookup[[i]])) {
      bunkerportsnews.lookup[i] = 0
    } else {
      bunkerportsnews.lookup[i] = bunkerportsnews.table.new.lookup[[i]]
    }
  }
  
  sum(bunkerportsnews.lookup == 0)
  which(bunkerportsnews.lookup == 0)
  bunkerportsnews.table.new$port[which(bunkerportsnews.lookup == 0)]
  sum(bunkerportsnews.lookup == 9999)
  which(bunkerportsnews.lookup == 9999)
  bunkerportsnews.table.new$port[which(bunkerportsnews.lookup == 9999)]
  
  
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Great Belt')] = 
    which(port_directory.table$port == 'Nyborg')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Reydarfjordur')] = 
    which(port_directory.table$port == 'Eskifjordur')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'St. Petersburg')] = 
    which(port_directory.table$port == 'St Petersburg' & port_directory.table$country == 'Russia')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Malta')] = 
    which(port_directory.table$port == 'Valletta')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Tenerife')] = 
    which(port_directory.table$port == 'Santa Cruz de Tenerife')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Kuwait')] = 
    which(port_directory.table$port == 'Mina Abdulla')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Belle Chasse')] = 
    which(port_directory.table$port == 'New Orleans')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Elizabethport')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Freeport (Bahamas)')] = 
    which(port_directory.table$port == 'Freeport' & port_directory.table$country == 'Bahamas')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Mayport')] = 
    which(port_directory.table$port == 'Jacksonville')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'New York')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Newark')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Pilottown')] = 
    which(port_directory.table$port == 'New Orleans')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Port Bolivar')] = 
    which(port_directory.table$port == 'Houston')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Port Chicago')] = 
    which(port_directory.table$port == 'Richmond (California)')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Port Ingleside')] = 
    which(port_directory.table$port == 'Corpus Christi')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Rainier')] = 
    which(port_directory.table$port == 'Longview')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Richmond')] = 
    which(port_directory.table$port == 'Richmond (California)')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'San Rafael')] = 
    which(port_directory.table$port == 'San Francisco')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'St. Eustatius')] = 
    which(port_directory.table$port == 'St Eustatius')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'St. Rose')] = 
    which(port_directory.table$port == 'New Orleans')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Stapleton')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Alpha zone')] = 
    which(port_directory.table$port == 'Buenos Aires')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Aruba')] = 
    which(port_directory.table$port == 'San Nicolas' & port_directory.table$country == 'Aruba')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Curacao')] = 
    which(port_directory.table$port == 'Willemstad')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Panama')] = 
    which(port_directory.table$port == 'Balboa')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Pointe A Pierre')] = 
    which(port_directory.table$port == 'Pointe-a-Pierre')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Port Of Spain')] = 
    which(port_directory.table$port == 'Port of Spain')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Ho Chi Minh City')] = 
    which(port_directory.table$port == 'Saigon')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Incheon')] = 
    which(port_directory.table$port == 'Inchon')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Jureles')] = 
    which(port_directory.table$port == 'Coronel')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Zona Comun')] = 
    which(port_directory.table$port == 'Buenos Aires')
  
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Lagos')] = 
    which(port_directory.table$port == 'Lagos' & port_directory.table$country == 'Nigeria')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Bayonne')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Portland')] = 
    which(port_directory.table$port == 'Portland' & 
            port_directory.table$country == 'United States of America' &
            port_directory.table$longitude < -100)
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Vancouver')] = 
    which(port_directory.table$port == 'Vancouver' & port_directory.table$country == 'Canada')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Cartagena')] = 
    which(port_directory.table$port == 'Cartagena' & port_directory.table$country == 'Colombia')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Kingston')] = 
    which(port_directory.table$port == 'Kingston' & port_directory.table$country == 'Jamaica')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'La Libertad')] = 
    which(port_directory.table$port == 'La Libertad' & port_directory.table$country == 'Ecuador')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Rio Grande')] = 
    which(port_directory.table$port == 'Rio Grande' & port_directory.table$country == 'Brazil')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'San Lorenzo')] = 
    which(port_directory.table$port == 'San Lorenzo' & port_directory.table$country == 'Honduras')
  bunkerportsnews.lookup[which(bunkerportsnews.table.new$port == 'Sydney')] = 
    which(port_directory.table$port == 'Sydney' & port_directory.table$country == 'Australia')
  
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
  
bunkerportsnews.lookup = 
  data.frame(bunkerportsnews.port = bunkerportsnews.table.new$port, 
             pd.line = bunkerportsnews.lookup, 
             stringsAsFactors = FALSE)

return(bunkerportsnews.lookup)
  
}