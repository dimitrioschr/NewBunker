get.bunkerportsnews.prices.from.scratch = function() {
  
  require(httr)
  require(XML)
  require(stringr)
  
  ######################################
  
  basePage = 'http://www.bunkerportsnews.com'
  h = handle(basePage)
  res = GET(handle = h, path = '/Ports.aspx?ElementID=d50809cf-d741-40f2-8bac-1cb6b8426073')
  
  resText = content(res, as = 'text')
  resText = unlist(str_split(resText, "<a href="))
  resText = resText[which(str_detect(resText, "PortDetails"))]
  resText = unlist(str_split(resText, "\r\n"))
  resText = resText[which(str_detect(resText, "PortDetails"))]
  
  #######################################
  
  port.data.frame = as.data.frame(matrix(nrow=length(resText), ncol=9))
  names(port.data.frame) = c('port', 'url', 'IFO380.price', 'IFO180.price', 'MDO.price', 'MGO.price', 
                             'has.prices', 'longitude', 'latitude')
  
  for (i in 1:length(resText)) {
    
    res = unlist(str_split(unlist(str_split(resText[i], "/"))[2], '"'))
    port.data.frame[i, 2] = res[1]
    res[2] = str_replace_all(res[2], ">", "")
    res[2] = str_replace_all(res[2], "<", "")
    port.data.frame[i, 1] = res[2]
    
  }
  
  for (i in 3:6) {
    port.data.frame[, i] = as.numeric(port.data.frame[, i])
  }
  
  
  for (i in 8:9) {
    port.data.frame[, i] = as.numeric(port.data.frame[, i])
  }
  
  ##################################################
  
  
  for (i in 1:length(port.data.frame[, 1])) {
    
    
    res = GET(handle = h, path = paste0("/", port.data.frame[i, 2]))
    resText = content(res, as = "text")
    port.data.frame$has.prices[i] = str_detect(resText, '<div class="location" >Bunker Prices</div><br />')
    seek.coordinates = unlist(str_split(resText, 'Coordinates: <span class="orange">'))[2]
    seek.coordinates = unlist(str_split(seek.coordinates, '<span></span>'))[1]
    seek.coordinates = str_replace(seek.coordinates, '\r\n', '')
    seek.coordinates = unlist(str_split(seek.coordinates, ','))
    seek.coordinates = as.numeric(seek.coordinates)
    port.data.frame$latitude[i] = seek.coordinates[1]
    port.data.frame$longitude[i] = seek.coordinates[2]
    print(i)
    
    if (port.data.frame$has.prices[i]) {
      
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
    
    
  }
  
  return(port.data.frame)
  
}