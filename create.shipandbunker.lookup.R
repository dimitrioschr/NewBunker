create.shipandbunker.lookup = function() {
  
  
  shipandbunker.table.new = get.shipandbunker.prices.fast()
  load('port_directory.table')
  
  
  shipandbunker.table.new.lookup = list()
  length(shipandbunker.table.new.lookup) = 
    length(shipandbunker.table.new$port)
  
  for (i in 1:length(shipandbunker.table.new$port)) {
    lookup.value = which(port_directory.table$port == shipandbunker.table.new$port[i])
    if (!(length(lookup.value) == 0)) {
      shipandbunker.table.new.lookup[[i]] = lookup.value
    } else {
      shipandbunker.table.new.lookup[[i]] = NA
    }
  }
  
  #   bunkerportsnews.table.new.lookup
  #   
  #   which(sapply(bunkerportsnews.table.new.lookup, length) > 1)
  #   which(sapply(bunkerportsnews.table.new.lookup, 
  #                function(x) {ifelse(length(x) == 1, 
  #                                    yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
  #                                    no = FALSE)}) == 1)
  
  shipandbunker.lookup = vector('numeric',
                              length(shipandbunker.table.new.lookup))
  
  for (i in 1:length(shipandbunker.table.new.lookup)) {
    if (length(shipandbunker.table.new.lookup[[i]]) > 1) {
      shipandbunker.lookup[i] = 9999
    } else if (is.na(shipandbunker.table.new.lookup[[i]])) {
      shipandbunker.lookup[i] = 0
    } else {
      shipandbunker.lookup[i] = shipandbunker.table.new.lookup[[i]]
    }
  }
  
  sum(shipandbunker.lookup == 0)
  which(shipandbunker.lookup == 0)
  shipandbunker.table.new$port[which(shipandbunker.lookup == 0)]
  sum(shipandbunker.lookup == 9999)
  which(shipandbunker.lookup == 9999)
  shipandbunker.table.new$port[which(shipandbunker.lookup == 9999)]
  
  

  
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'New York')] = 
    which(port_directory.table$port == 'New York & New Jersey')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Norfolk VA')] = 
    which(port_directory.table$port == 'Norfolk')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'St John')] = 
    which(port_directory.table$port == 'Saint John')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'LA / Long Beach')] = 
    which(port_directory.table$port == 'Long Beach')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Aruba')] = 
    which(port_directory.table$port == 'San Nicolas' & port_directory.table$country == 'Aruba')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Balboa, Panama')] = 
    which(port_directory.table$port == 'Balboa')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Bonaire')] = 
    which(port_directory.table$port == 'Kralendijk')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Cristobal, Panama')] = 
    which(port_directory.table$port == 'Cristobal')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Curacao')] = 
    which(port_directory.table$port == 'Willemstad')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Guaranao Bay')] = 
    which(port_directory.table$port == 'Punta Cardon')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Fortaleza')] = 
    which(port_directory.table$port == 'Fortaleza (Mucuripe)')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'San Nicolás')] = 
    which(port_directory.table$port == 'Buenos Aires')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Vila de Conde')] = 
    which(port_directory.table$port == 'Vila do Conde')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Reydarfjordur')] = 
    which(port_directory.table$port == 'Eskifjordur')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Tenerife')] = 
    which(port_directory.table$port == 'Santa Cruz de Tenerife')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Damman')] = 
    which(port_directory.table$port == 'Dammam')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Off- Angola')] = 
    which(port_directory.table$port == 'Luanda')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Off- Congo')] = 
    which(port_directory.table$port == 'Banana')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Jakarta')] = 
    which(port_directory.table$port == 'Tanjung Priok')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Surabaya')] = 
    which(port_directory.table$port == 'Tanjung Perak')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Keelung (Chilung)')] = 
    which(port_directory.table$port == 'Keelung')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Suao')] = 
    which(port_directory.table$port == 'Su-Ao')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Vostochny Port')] = 
    which(port_directory.table$port == 'Vostochnyy')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Bedi')] = 
    which(port_directory.table$port == 'Bedi Bunder')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Cochin (Kochi)')] = 
    which(port_directory.table$port == 'Cochin')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Hambantota')] = 
    which(port_directory.table$port == 'Galle')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Jamnagar')] = 
    which(port_directory.table$port == 'Jamnagar Terminal')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Jawaharlal (JNPT)')] = 
    which(port_directory.table$port == 'Jawaharlal Nehru Port')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Port Gwadar')] = 
    which(port_directory.table$port == 'Gwadar')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Port Muhammad Bin Qasim')] = 
    which(port_directory.table$port == 'Muhammad Bin Qasim')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Rozi')] = 
    which(port_directory.table$port == 'Jamnagar Terminal')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Vadinar')] = 
    which(port_directory.table$port == 'Vadinar Terminal')
  
  
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Hamilton')] = 
    which(port_directory.table$port == 'Hamilton' & port_directory.table$country == 'Canada')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Portland')] = 
    which(port_directory.table$port == 'Portland' & 
            port_directory.table$country == 'United States of America' &
            port_directory.table$longitude < -100)
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Vancouver')] = 
    which(port_directory.table$port == 'Vancouver' & port_directory.table$country == 'Canada')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Cartagena')] = 
    which(port_directory.table$port == 'Cartagena' & port_directory.table$country == 'Colombia')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Freeport')] = 
    which(port_directory.table$port == 'Freeport' & port_directory.table$country == 'Bahamas')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Kingston')] = 
    which(port_directory.table$port == 'Kingston' & port_directory.table$country == 'Jamaica')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Rio Grande')] = 
    which(port_directory.table$port == 'Rio Grande' & port_directory.table$country == 'Brazil')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'San Lorenzo')] = 
    which(port_directory.table$port == 'Buenos Aires')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'La Libertad')] = 
    which(port_directory.table$port == 'La Libertad' & port_directory.table$country == 'Ecuador')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'St Petersburg')] = 
    which(port_directory.table$port == 'St Petersburg' & port_directory.table$country == 'Russia')
  shipandbunker.lookup[which(shipandbunker.table.new$port == 'Sydney')] = 
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
  
shipandbunker.lookup = 
  data.frame(shipandbunker.port = shipandbunker.table.new$port, 
             pd.line = shipandbunker.lookup, 
             stringsAsFactors = FALSE)

return(shipandbunker.lookup)
  
}