get.bunkerportsnews.prices.from.previous = function(port.data.frame) {
  
  require(httr)
  require(XML)
  require(stringr)
  
  basePage = 'http://www.bunkerportsnews.com'
  h = handle(basePage)
  
  
  for (i in which(port.data.frame$has.prices)) {
    
    res = GET(handle = h, path = paste0("/", port.data.frame[i, 2]))
    resText = content(res, as = "text")
    
    print(i)
    resText = unlist(str_split(resText, '<div class="location" >Bunker Prices</div><br />'))[2]
    resText = unlist(str_split(resText, '<div class="rightmap">'))[1]
    resText = unlist(str_split(resText, '\r\n'))
    
    IFO380.line = which(str_detect(resText, 'IFO380'))
    IFO380.price = as.numeric(
      str_replace(
        unlist(str_split(resText[IFO380.line + 1], '<td width=\"50%\">'))[2], 
        '</td>', ''
      )
    )
    
    IFO180.line = which(str_detect(resText, 'IFO180'))
    IFO180.price = as.numeric(
      str_replace(
        unlist(str_split(resText[IFO180.line + 1], '<td width=\"50%\">'))[2], 
        '</td>', ''
      )
    )
    
    MDO.line = which(str_detect(resText, 'MDO'))
    MDO.price = as.numeric(
      str_replace(
        unlist(str_split(resText[MDO.line + 1], '<td width=\"50%\">'))[2], 
        '</td>', ''
      )
    )
    
    MGO.line = which(str_detect(resText, 'MGO'))
    MGO.price = as.numeric(
      str_replace(
        unlist(str_split(resText[MGO.line + 1], '<td width=\"50%\">'))[2], 
        '</td>', ''
      )
    )
    
    port.data.frame[i, 3] = IFO380.price
    port.data.frame[i, 4] = IFO180.price
    port.data.frame[i, 5] = MDO.price
    port.data.frame[i, 6] = MGO.price
    
  }
  
  
  return(port.data.frame)
  
}