get.navigatemag.prices = function() {
    
  library(stringr)
  
  results.data.frame = as.data.frame(matrix(nrow=1, ncol=5))
  results.data.frame[, ] = as.numeric(results.data.frame[, ])
  results.data.frame[, 1] =as.character(results.data.frame[, 1])
  names(results.data.frame) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO')
  
  for (i in 0:5) {
    
    page = paste0('http://navigatemag.ru/bunker/', i)
    text = readLines(page)
    table = text[which(str_detect(text, 'Last update:'))]
    table = unlist(str_split(table, 'class=bunav><td>'))
    
    
    for (j in 3:length(table)) {
      
      port.entry = str_replace_all(unlist(str_split(table[j], 'td>')), '</', '')
      port = port.entry[1]
      port = str_replace_all(port, "[.',]", "")
      IFO180 = as.numeric(unlist(str_split(port.entry[5], '&nbsp'))[1])
      IFO380 = as.numeric(unlist(str_split(port.entry[9], '&nbsp'))[1])
      MGO = as.numeric(unlist(str_split(port.entry[13], '&nbsp'))[1])
      MDO = as.numeric(unlist(str_split(port.entry[17], '&nbsp'))[1])
      row.to.bind = data.frame(port, IFO380, IFO180, MDO, MGO)
      results.data.frame = rbind(results.data.frame, row.to.bind)
      
    }
    
  }
    
    
  to.add = matrix(nrow = dim(results.data.frame)[1], ncol = 4)
  to.add = as.data.frame(to.add)
  results.data.frame = cbind(results.data.frame, to.add)
  for (i in 6:9) {
    results.data.frame[, i] = as.numeric(results.data.frame[, i])
  }
  
  names(results.data.frame) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO',
                                'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  results.data.frame$port = as.character(results.data.frame$port)
  
  
  return(results.data.frame[2:dim(results.data.frame)[1], ])
  
}