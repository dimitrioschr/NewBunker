load('port_directory.table')
source('~/BunkerPrices/get.navigatemag.prices.R')
navigatemag.prices = get.navigatemag.prices()


no.ports = length(navigatemag.prices[, 1])

coord.table = matrix(data=0,nrow=no.ports, ncol=3)

for (i in 1:no.ports) {
  
  port.line = which(
    str_detect(tolower(as.character(port_directory.table$port)), 
               tolower(navigatemag.prices$port.name[i])
               )
    )
  
#   port.line = which(
#     tolower(as.character(port_directory.table$port)) ==
#       tolower(navigatemag.prices$port.name[i])
#     )
  
  
  if (length(port.line) > 1) {print(
    paste(port.line, port_directory.table$port[port.line])
    )
  }
  
  if (length(port.line) == 0) {print(
    navigatemag.prices$port.name[i]
    )
  }
  
  coord.table[i, 1] = port_directory.table$longitude[port.line[1]]
  coord.table[i, 2] = port_directory.table$latitude[port.line[1]]
  coord.table[i, 3] = length(port.line)
  
}
