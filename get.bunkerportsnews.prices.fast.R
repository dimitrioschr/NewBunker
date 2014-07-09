get.bunkerportsnews.prices.fast = function(port.data.frame) {
  
  require(httr)
  require(XML)
  require(stringr)
  
  basePage = 'http://www.bunkerportsnews.com'
  h = handle(basePage)
  res = GET(handle = h, path = paste0("/", 'BunkerPrices.aspx?ElementName=BunkerPrices&Port=c9d13874-b25d-4501-a7c9-f1bbef2bf590'))
  resText = content(res, as = 'text')
  resText = unlist(str_split(resText, '<tr id="ctl00_ContentPlaceHolder1_rptrContinents'))
    
  
  for (i in 2:length(resText)) {
    
    port.section = unlist(str_split(resText[i], 'td>'))
    port.section = str_replace_all(port.section, '</', '')
    IFO380.price = as.numeric(str_replace_all(port.section[2], ',', ''))
    IFO180.price = as.numeric(str_replace_all(port.section[7], ',', ''))
    MDO.price = as.numeric(str_replace_all(port.section[12], ',', ''))
    MGO.price = as.numeric(str_replace_all(port.section[17], ',', ''))
    port.section = unlist(str_split(port.section[1], 'a>'))
    port.section = unlist(str_split(port.section[1], '">'))
    port.name = str_trim(port.section[4], side = "both")
        
    port.data.frame$IFO380.price[which(port.data.frame$port == port.name)] = IFO380.price
    port.data.frame$IFO180.price[which(port.data.frame$port == port.name)] = IFO180.price
    port.data.frame$MDO.price[which(port.data.frame$port == port.name)] = MDO.price
    port.data.frame$MGO.price[which(port.data.frame$port == port.name)] = MGO.price
    
  } 
  
  return(port.data.frame)
  
}