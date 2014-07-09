source('~/Documents/RStudio/BunkerPricesWeb/create.port.list.R')

page.list = create.port.list()

library(RCurl)
library(stringr)

my.list = list()
length( my.list ) = dim( page.list )[ 1 ]

for ( i in 1:dim( page.list )[ 1 ] ) {
  
  print( i )
  my.list[[ i ]] = getURL( as.character( page.list[ i, 2 ] ) )

}

theget = getURL( as.character( page.list[ 2, 2 ] ) )
theread = readLines( as.character( page.list[ 2, 2 ] ) )
thegetworked = unlist(str_split(theget, '\n'))
