get.consolidated.bunker.prices = function() {
  
  library(XML)
  library(httr)
  library(stringr)
  library(RCurl)
  
  
  names.vector = c('port', 'longitude', 'latitude', 
                   'IFO380', 'IFO180', 'MDO', 'MGO', 
                   'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  load('bunkerportsnews.table')
  source('~/RStudio/BunkerPricesWeb/get.bunkerportsnews.prices.fast.R', echo=FALSE)
  bunkerportsnews.table.new = get.bunkerportsnews.prices.fast(bunkerportsnews.table)
  rm(bunkerportsnews.table)
  
  source('~/RStudio/BunkerPricesWeb/get.navigatemag.prices.R', echo=FALSE)
  navigatemag.table.new = get.navigatemag.prices()
  
  source('~/RStudio/BunkerPricesWeb/get.marine.news.prices.R', echo=FALSE)
  marine.news.table.new = get.marine.news.prices()
  
  source('~/RStudio/BunkerPricesWeb/get.bunkerindex.prices.R', echo=FALSE)
  bunkerindex.table.new = get.bunkerindex.prices()
  
  source('~/RStudio/BunkerPricesWeb/get.shipandbunker.prices.R', echo=FALSE)
  shipandbunker.table.new = get.shipandbunker.prices()
    
  
}








