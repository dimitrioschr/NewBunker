get.bunkerportsnews.prices.from.summary = function() {
  
  library(httr)
  library(XML)
  library(stringr)
  
  basePage = 'http://www.bunkerportsnews.com'
  h = handle(basePage)
  res = GET(handle = h, path = paste0("/", 'BunkerPrices.aspx?ElementName=BunkerPrices&Port=c9d13874-b25d-4501-a7c9-f1bbef2bf590'))
  resText = content(res, as = 'text')
  resText = unlist(str_split(resText, '<tr id="ctl00_ContentPlaceHolder1_rptrContinents'))
  
  port.data.frame = data.frame(port = vector('character', length(resText)-1), 
                               IFO380 = vector('numeric', length(resText)-1),
                               IFO180 = vector('numeric', length(resText)-1),
                               MDO = vector('numeric', length(resText)-1),
                               MGO = vector('numeric', length(resText)-1),
                               LS380 = as.numeric(vector('character', length(resText)-1)),
                               LS180 = as.numeric(vector('character', length(resText)-1)),
                               LSMDO = as.numeric(vector('character', length(resText)-1)),
                               LSMGO = as.numeric(vector('character', length(resText)-1)), 
                               stringsAsFactors = FALSE)
  
  
  for (i in 2:length(resText)) {
    
    # print(i)
    
    port.section = unlist(str_split(resText[i], 'td>'))
    port.section = str_replace_all(port.section, '</', '')
    IFO380.price = as.numeric(str_replace_all(port.section[2], ',', ''))
    IFO180.price = as.numeric(str_replace_all(port.section[7], ',', ''))
    MDO.price = as.numeric(str_replace_all(port.section[12], ',', ''))
    MGO.price = as.numeric(str_replace_all(port.section[17], ',', ''))
    port.section = unlist(str_split(port.section[1], 'a>'))
    port.section = unlist(str_split(port.section[1], '">'))
    port.name = str_trim(port.section[4], side = "both")
    
    port.data.frame$port[i-1] = port.name
    port.data.frame$IFO380[i-1] = IFO380.price
    port.data.frame$IFO180[i-1] = IFO180.price
    port.data.frame$MDO[i-1] = MDO.price
    port.data.frame$MGO[i-1] = MGO.price
    
  } 
  
  return(port.data.frame)
  
}