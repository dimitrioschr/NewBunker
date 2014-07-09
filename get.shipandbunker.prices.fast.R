get.shipandbunker.prices.fast = function() {
  
  library(RCurl)
  library(XML)
  library(stringr)
  
  page.url.1 = 'http://shipandbunker.com/prices/am' # 5
  page.url.2 = 'http://shipandbunker.com/prices/emea' # 4
  page.url.3 = 'http://shipandbunker.com/prices/apac' # 4
  
  
  page.content = getURL(page.url.1)
  table = readHTMLTable(page.content, 
                        header = FALSE, 
                        which = 1, 
                        stringsAsFactors = FALSE)
  
  for (i in 2:5) {
    
    table = rbind(table, readHTMLTable(page.content,
                                       header = FALSE, 
                                       which = i, 
                                       stringsAsFactors = FALSE)
    )
    
  }
  
  
  page.content = getURL(page.url.2)
  
  for (i in 1:4) {
    
    table = rbind(table, readHTMLTable(page.content,
                                       header = FALSE, 
                                       which = i, 
                                       stringsAsFactors = FALSE)
    )
    
  }
  
  
  page.content = getURL(page.url.3)
  
  for (i in 1:4) {
    
    table = rbind(table, readHTMLTable(page.content,
                                       header = FALSE, 
                                       which = i, 
                                       stringsAsFactors = FALSE)
    )
    
  }
  
  
  table
  
  cases = dim(table)[1]
  variables = dim(table)[2]
  
  for (i in 1:cases){
    for (j in 2:variables){
      table[i, j] = as.numeric(
        str_extract(table[i, j], 
                    '[0-9]*.[0-9]*')
      )
    }
  }
  
  for (i in 7:9) {
    table[, i] = table[, 6]
  }
  
  for (i in 2:9) {
    table[, i] = as.numeric(table[, i])
  }
  
  names(table) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO', 
                   'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  return(table)
  
}