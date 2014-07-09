create.navigatemag.lookup = function() {
  
  
  navigatemag.table.new = get.navigatemag.prices()
  load('port_directory.table')
  
  
  navigatemag.table.new.lookup = list()
  length(navigatemag.table.new.lookup) = 
    length(navigatemag.table.new$port)
  
  for (i in 1:length(navigatemag.table.new$port)) {
    lookup.value = which(port_directory.table$port == navigatemag.table.new$port[i])
    if (!(length(lookup.value) == 0)) {
      navigatemag.table.new.lookup[[i]] = lookup.value
    } else {
      navigatemag.table.new.lookup[[i]] = NA
    }
  }
  
  #   bunkerportsnews.table.new.lookup
  #   
  #   which(sapply(bunkerportsnews.table.new.lookup, length) > 1)
  #   which(sapply(bunkerportsnews.table.new.lookup, 
  #                function(x) {ifelse(length(x) == 1, 
  #                                    yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
  #                                    no = FALSE)}) == 1)
  
  navigatemag.lookup = vector('numeric', 
                              length(navigatemag.table.new.lookup))
  
  for (i in 1:length(navigatemag.table.new.lookup)) {
    if (length(navigatemag.table.new.lookup[[i]]) > 1) {
      navigatemag.lookup[i] = 9999
    } else if (is.na(navigatemag.table.new.lookup[[i]])) {
      navigatemag.lookup[i] = 0
    } else {
      navigatemag.lookup[i] = navigatemag.table.new.lookup[[i]]
    }
  }
  
  sum(navigatemag.lookup == 0)
  which(navigatemag.lookup == 0)
  navigatemag.table.new$port[which(navigatemag.lookup == 0)]
  sum(navigatemag.lookup == 9999)
  which(navigatemag.lookup == 9999)
  navigatemag.table.new$port[which(navigatemag.lookup == 9999)]
  
  
  
  navigatemag.lookup[which(navigatemag.table.new$port == 'Great Belt')] = 
    which(port_directory.table$port == 'Nyborg')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Saint Petersburg')] = 
    which(port_directory.table$port == 'St Petersburg' & port_directory.table$country == 'Russia')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Alpha zone')] = 
    which(port_directory.table$port == 'Buenos Aires')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Curacao')] = 
    which(port_directory.table$port == 'Willemstad')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Jureles')] = 
    which(port_directory.table$port == 'Coronel')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Pointe A Pierre')] = 
    which(port_directory.table$port == 'Pointe-a-Pierre')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Port Of Spain')] = 
    which(port_directory.table$port == 'Port of Spain')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Porto Trinidad')] = 
    which(port_directory.table$port == 'Panama Canal')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Rio De Janeiro')] = 
    which(port_directory.table$port == 'Rio de Janeiro')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Zona Comun')] = 
    which(port_directory.table$port == 'Buenos Aires')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Malta')] = 
    which(port_directory.table$port == 'Valletta')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Salonica')] = 
    which(port_directory.table$port == 'Thessaloniki')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Syros')] = 
    which(port_directory.table$port == 'Syros Island')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Ho Chi Minh City')] = 
    which(port_directory.table$port == 'Saigon')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Incheon')] = 
    which(port_directory.table$port == 'Inchon')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Kosichang')] = 
    which(port_directory.table$port == 'Kohsichang TPP')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Kuwait')] = 
    which(port_directory.table$port == 'Mina Abdulla')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Tenerife')] = 
    which(port_directory.table$port == 'Santa Cruz de Tenerife')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Belle Chasse')] = 
    which(port_directory.table$port == 'New Orleans')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Elizabethport')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Mayport')] = 
    which(port_directory.table$port == 'Jacksonville')
  navigatemag.lookup[which(navigatemag.table.new$port == 'New York')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Newark')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Pilottown')] = 
    which(port_directory.table$port == 'New Orleans')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Port Bolivar')] = 
    which(port_directory.table$port == 'Houston')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Port Chicago')] = 
    which(port_directory.table$port == 'Richmond (California)')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Port Ingleside')] = 
    which(port_directory.table$port == 'Corpus Christi')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Rainier')] = 
    which(port_directory.table$port == 'Longview')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Richmond')] = 
    which(port_directory.table$port == 'Richmond (California)')
  navigatemag.lookup[which(navigatemag.table.new$port == 'San Rafael')] = 
    which(port_directory.table$port == 'San Francisco')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Stapleton')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  
  
  navigatemag.lookup[which(navigatemag.table.new$port == 'Cartagena')] = 
    which(port_directory.table$port == 'Cartagena' & port_directory.table$country == 'Colombia')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Kingston')] = 
    which(port_directory.table$port == 'Kingston' & port_directory.table$country == 'Jamaica')
  navigatemag.lookup[which(navigatemag.table.new$port == 'San Lorenzo')] = 
    which(port_directory.table$port == 'San Lorenzo' & port_directory.table$country == 'Honduras')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Lagos')] = 
    which(port_directory.table$port == 'Lagos' & port_directory.table$country == 'Nigeria')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Bayonne')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  navigatemag.lookup[which(navigatemag.table.new$port == 'Portland')] = 
    which(port_directory.table$port == 'Portland' & 
            port_directory.table$country == 'United States of America' &
            port_directory.table$longitude < -100)
  navigatemag.lookup[which(navigatemag.table.new$port == 'Vancouver')] = 
    which(port_directory.table$port == 'Vancouver' & port_directory.table$country == 'Canada')
  
  
  
  
  
  
  
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
  
navigatemag.lookup = 
  data.frame(navigatemag.port = navigatemag.table.new$port, 
             pd.line = navigatemag.lookup, 
             stringsAsFactors = FALSE)

return(navigatemag.lookup)
  
}