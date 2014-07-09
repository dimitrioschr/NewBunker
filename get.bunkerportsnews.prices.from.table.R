get.bunkerportsnews.prices.from.table = function() {
  
  
  library(XML)
  
  
  checker = readLines('http://www.bunkerportsnews.com/BunkerPrices.aspx?ElementID=26f6ad53-6e88-4490-8f2b-a1cc4925f82c')
  bunkers.table.2 = readHTMLTable(checker, header=TRUE, which=2,stringsAsFactors=F)
  bunkers.table.3 = readHTMLTable(checker, header=TRUE, which=3,stringsAsFactors=F)
  bunkers.table.4 = readHTMLTable(checker, header=TRUE, which=4,stringsAsFactors=F)
  bunkers.table.5 = readHTMLTable(checker, header=TRUE, which=5,stringsAsFactors=F)
  bunkers.table.6 = readHTMLTable(checker, header=TRUE, which=6,stringsAsFactors=F)
  bunkers.table.7 = readHTMLTable(checker, header=TRUE, which=7,stringsAsFactors=F)
  bunkers.table.8 = readHTMLTable(checker, header=TRUE, which=8,stringsAsFactors=F)
  bunkers.table.9 = readHTMLTable(checker, header=TRUE, which=9,stringsAsFactors=F)
  
  
  bunkers.table = rbind(bunkers.table.2,
                        bunkers.table.3,
                        bunkers.table.4,
                        bunkers.table.5,
                        bunkers.table.6,
                        bunkers.table.7,
                        bunkers.table.8,
                        bunkers.table.9)
  
  
  bunkers.table = cbind(bunkers.table[, c(1, 2, 5, 8, 11)],
                        matrix(nrow = dim(bunkers.table)[1], 
                               ncol = 4)
  )
  
  
  for (i in 2:9) {
    bunkers.table[, i] = as.numeric(as.character(bunkers.table[, i]))
  }
  
  
  names(bunkers.table) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO', 
                           'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  return(bunkers.table)
  
}