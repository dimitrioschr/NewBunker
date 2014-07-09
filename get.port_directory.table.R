# create encyclopedic data.frame of all ports in port-directory.com

library('stringr')

data.list = list()
# 
# data.list length is set here and used throughout!
# 
length(data.list) = 114



data.list[[1]] = readLines("http://www.port-directory.com/ports/list/")

for (i in 2:length(data.list)) {
  
  txt = paste0("http://www.port-directory.com/ports/list/P", 40*(i-1))
  # print(txt)
  data.list[[i]] = readLines(txt)
  
}

rm(txt)

data.list2 = list()
length(data.list2) = length(data.list)

for (i in 1:length(data.list)) {
  
  content = as.matrix(data.list[[i]])
  country.lines = which(str_detect(content, '<img src="/images/spacer.png" width="16" height="24" alt="'))
  country.content = unlist(str_split(content[country.lines],'\t\t\t<img src=\"/images/spacer.png\" width=\"16\" height=\"24\" alt=\"'))
  ref.lines = which(str_detect(country.content, '\" class=\"flag2 fl_'))
  country.content = unlist(str_split(country.content[ref.lines],'\" class=\"flag2 fl_'))
  ref.lines = which(!(str_detect(country.content, '"')))
  country.content = country.content[ref.lines]
  
  port.lines = country.lines + 1
  port.content = unlist(str_split(content[port.lines],'a href="/ports/'))
  ref.lines = which(str_detect(port.content, '</a>'))
  port.content = unlist(str_split(port.content[ref.lines],'>'))
  ref.lines = which(str_detect(port.content, '<'))
  port.content = unlist(str_split(port.content[ref.lines],'<'))
  ref.lines = which(!(str_detect(port.content, '/a')))
  port.content = port.content[ref.lines]
  
  url.lines = port.lines
  url.content = unlist(str_split(content[url.lines],'a href="/ports/'))
  ref.lines = which(str_detect(url.content, '">'))
  url.content = unlist(str_split(url.content[ref.lines], '">'))
  ref.lines = which(!str_detect(url.content, '>'))
  url.content = url.content[ref.lines]
  url.content = paste0('http://www.port-directory.com/ports/', url.content)
  
  data.list2[[i]] = data.frame(country = country.content, port = port.content, url = url.content)
  rm(content, country.content, port.content, url.content, country.lines, port.lines, ref.lines)

}

rm(data.list)

for (i in 2:length(data.list2)) {
  
  data.list2[[1]] = rbind(data.list2[[1]], data.list2[[i]])  
  
}

port.data.frame = data.list2[[1]]
rm(data.list2)

# manual corrections --- improve url acquisition code!!!
# port.data.frame$country = as.character(port.data.frame$country)
# port.data.frame$port = as.character(port.data.frame$port)
# port.data.frame$url = as.character(port.data.frame$url)


port.data.more = as.data.frame(matrix(nrow = length(port.data.frame[, 1]), ncol = 15))
names(port.data.more) = c('longitude', 'latitude', 'timezone', 'portcode', 'maxportdepth', 
                          'is.drybulk', 'is.roro', 'is.drydock', 'is.towage', 'is.airport',
                          'is.generalcargobulk', 'is.bunkers', 'is.otherliquid', 
                          'is.containers', 'is.petroleum')

for (i in 1:length(port.data.frame[, 1])) {
  
  # 
  # print index to follow execution...
  # and pause 0.25 second not to overwhelm the target server
  # 
  print(i)
  Sys.sleep(0.25)
  
  port.page = readLines(as.character(port.data.frame$url[i]))
  
  if (length(port.page) != 0) {
    
    long.line = which(str_detect(port.page, 'Longitude'))
    long.elements1 = unlist(str_split(unlist(str_split(port.page[long.line], '</td><td>'))[2], '&deg; '))
    long.elements2 = unlist(str_split(long.elements1[2], "'"))
    long.elements3 = unlist(str_split(str_replace(long.elements2[2], '</td></tr>', ''), " "))[3]
    long.final = (as.numeric(long.elements1[1]) + as.numeric(long.elements2[1])/60)*ifelse(long.elements3=="E", 1, -1)
    port.data.more$longitude[i] = long.final
    
    lat.line = which(str_detect(port.page, 'Latitude'))
    lat.elements1 = unlist(str_split(unlist(str_split(port.page[lat.line], '</td><td>'))[2], '&deg; '))
    lat.elements2 = unlist(str_split(lat.elements1[2], "'"))
    lat.elements3 = unlist(str_split(str_replace(lat.elements2[2], '</td></tr>', ''), " "))[3]
    lat.final = (as.numeric(lat.elements1[1]) + as.numeric(lat.elements2[1])/60)*ifelse(lat.elements3=="N", 1, -1)
    port.data.more$latitude[i] = lat.final
    
    
    time.line = which(str_detect(port.page, 'Time&nbsp;zone'))
    if (sum(str_detect(port.page, 'Time&nbsp;zone')) != 0) {port.data.more$timezone[i] = str_replace(unlist(str_split(port.page[time.line], '<tr><td>Time&nbsp;zone:</td><td>'))[2], '</td></tr>\t\t\t\t\t\t', '')}
    
    code.line = which(str_detect(port.page, 'UN/LOCODE'))
    if (sum(str_detect(port.page, 'UN/LOCODE')) != 0) {port.data.more$portcode[i] = str_replace(str_replace(port.page[code.line], '\t      <tr><td>UN/LOCODE:</td><td>', ''), '</td></tr>\t\t\t\t\t\t', '')}
    
    depth.line = which(str_detect(port.page, 'Max&nbsp;depth'))
    if (sum(str_detect(port.page, 'Max&nbsp;depth')) != 0) {port.data.more$maxportdepth[i] = str_replace(str_replace(port.page[depth.line], '\t      <tr><td>Max&nbsp;depth:</td><td>', ''), 'm</td></tr>\t\t\t\t\t\t', '')}
    
    facilities.line = which(str_detect(port.page, '<div id="facilities">'))
    
    port.data.more$is.drybulk[i] = sum(str_detect(port.page, '<li>Dry Bulk</li>'))
    port.data.more$is.roro[i] = sum(str_detect(port.page, '<li>Ro/Ro</li>'))
    port.data.more$is.drydock[i] = sum(str_detect(port.page, '<li>Dry Dock</li>'))
    port.data.more$is.towage[i] = sum(str_detect(port.page, '<li>Towage</li>'))
    port.data.more$is.airport[i] = sum(str_detect(port.page, '<li>Airport</li>'))
    port.data.more$is.generalcargobulk[i] = sum(str_detect(port.page, '<li>General Cargo Bulk</li>'))
    port.data.more$is.bunkers[i] = sum(str_detect(port.page, '<li>Bunkers</li>'))
    port.data.more$is.otherliquid[i] = sum(str_detect(port.page, '<li>Other Liquid</li>'))
    port.data.more$is.containers[i] = sum(str_detect(port.page, '<li>Containers</li>'))
    port.data.more$is.petroleum[i] = sum(str_detect(port.page, '<li>Petroleum</li>'))
    
  }
  
}

port.data.frame = cbind(port.data.frame, port.data.more)

save(port.data.frame, file = 'port.data.frame')

