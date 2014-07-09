get.shipandbunker.prices = function() {
  
  library(RCurl)
  library(stringr)
  source('~/BunkerPricesWeb/create.port.list.R')
  
  page.list = create.port.list()
  length.page.list = length(page.list[, 1])
  text.data = as.data.frame(matrix(nrow = length.page.list, ncol = 2))
  names(text.data) = c('port', 'country')
  num.data = as.data.frame(matrix(nrow = length.page.list, ncol = 8))
  names(num.data) = c('IFO380', 'IFO180', 'MDO', 'MGO', 'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  my.list = list()
  length(my.list) = dim(page.list)[1]
  
  for (i in 1:dim(page.list)[1]) {
    my.list[[i]] = getURL(as.character(page.list[i, 2]))
    print(paste('downloading ', i))
  }
  
  
  
  for (i in 1:length.page.list) {
    
    print(paste('processing ', i))
    
    page.content = unlist(str_split(my.list[[i]], '\n'))
    
    port.line = which(str_detect(page.content, 'class="active" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="" itemprop="url"><span itemprop="title">'))
    text.data$port[i] = unlist(str_split(
      unlist(str_split(page.content[port.line], 'href="" itemprop="url"><span itemprop="title">'))[2],
      '<'
    ))[1]
    
    country.line = which(str_detect(page.content, 'style="padding:0 0 0 5px !important; color: #929697;'))
    if (length(country.line) != 0) {
      text.data$country[i] = unlist(str_split(
        unlist(str_split(page.content[country.line], 'important; color: #929697;">\\('))[2],
        ')</a>'
      ))[1]
    } else {text.data$country[i] = text.data$port[i]}
    
    IFO380.line = which(str_detect(page.content, 'row-0-IFO380'))
    if (length(IFO380.line) != 0) {
      num.data$IFO380[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[IFO380.line + 1], '<td headers="price-IFO380">'))[2], 
          '<span class'
        ))[1])
    }
    
    IFO180.line = which(str_detect(page.content, 'row-0-IFO180'))
    if (length(IFO180.line) != 0) {
      num.data$IFO180[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[IFO180.line + 1], '<td headers="price-IFO180">'))[2], 
          '<span class'
        ))[1])
    }
    
    MDO.line = which(str_detect(page.content, 'row-0-MDO'))
    if (length(MDO.line) != 0) {
      num.data$MDO[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[MDO.line + 1], '<td headers="price-MDO">'))[2], 
          '<span class'
        ))[1])
    }
    
    MGO.line = which(str_detect(page.content, 'row-0-MGO'))
    if (length(MGO.line) != 0) {
      num.data$MGO[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[MGO.line + 1], '<td headers="price-MGO">'))[2], 
          '<span class'
        ))[1])
    }
    
    LS380.line = which(str_detect(page.content, 'row-0-LS380'))
    if (length(LS380.line) != 0) {
      num.data$LS380[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[LS380.line + 1], '<td headers="price-LS380">'))[2], 
          '<span class'
        ))[1])
    }
    
    LS180.line = which(str_detect(page.content, 'row-0-LS180'))
    if (length(LS180.line) != 0) {
      num.data$LS180[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[LS180.line + 1], '<td headers="price-LS180">'))[2], 
          '<span class'
        ))[1])
    }
    
    LSMDO.line = which(str_detect(page.content, 'row-0-LSMDO'))
    if (length(LSMDO.line) != 0) {
      num.data$LSMDO[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[LSMDO.line + 1], '<td headers="price-LSMDO">'))[2], 
          '<span class'
        ))[1])
    }
    
    LSMGO.line = which(str_detect(page.content, 'row-0-LSMGO'))
    if (length(LSMGO.line) != 0) {
      num.data$LSMGO[i] = as.numeric(
        unlist(str_split(
          unlist(str_split(page.content[LSMGO.line + 1], '<td headers="price-LSMGO">'))[2], 
          '<span class'
        ))[1])
    }
    
  }
  
  shipandbunker.table = cbind(page.list, text.data, num.data)
  shipandbunker.table = shipandbunker.table[, c(3, 5:12)]
  
}