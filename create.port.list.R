create.port.list = function() {
  
  library('stringr')
  
  # feeder webpages
  # http://shipandbunker.com/prices/am
  # http://shipandbunker.com/prices/emea
  # http://shipandbunker.com/prices/apac
  
  # use url of webpages to get content
  americas.content = readLines('http://shipandbunker.com/prices/am')
  emea.content = readLines('http://shipandbunker.com/prices/emea')
  apac.content = readLines('http://shipandbunker.com/prices/apac')
  # seek line including 'row-0-IFO380', i.e. find instances by looking up first price entry
  americas.port.lines = grep('<th scope="row"><a href="http://shipandbunker.com/prices/', americas.content)
  emea.port.lines = grep('<th scope="row"><a href="http://shipandbunker.com/prices/', emea.content)
  apac.port.lines = grep('<th scope="row"><a href="http://shipandbunker.com/prices/', apac.content)
  
  # # print to check
  # americas.port.lines
  # emea.port.lines
  # apac.port.lines
  
  # # extraction logic
  # page.content[360]
  # address   = unlist(str_split(str_extract(page.content[360], 'http://.*'), '\">'))[1]
  # port.name = unlist(str_split(str_extract(page.content[360], 'http://.*'), '\">'))[2]
  # port.name = unlist(str_split(port.name, '</a>'))[1]
  # address
  # port.name
  # length(port.lines)
  
  # get total number of ports
  l.americas = length(americas.port.lines)
  l.emea = length(emea.port.lines)
  l.apac = length(apac.port.lines)
  # set up a list
  ports.and.data = list(port.name = as.character(1:(l.americas + l.emea + l.apac)), 
                        port.url = as.character(1:(l.americas + l.emea + l.apac)))
  
  # cycle through americas, get port names and shipandbunkers.com url's, place in newly defined list
  for (i in 1:l.americas) {
    # extract part after some url... keep first part
    # split-off what follows after:   \">
    address = unlist(str_split(str_extract(americas.content[americas.port.lines[i]], 'http://.*'), '\">'))[1]
    # extract part after the url... keep second part
    port.name = unlist(str_split(str_extract(americas.content[americas.port.lines[i]], 'http://.*'), '\">'))[2]
    # split at:   </a>   and keep first part
    port.name = unlist(str_split(port.name, '</a>'))[1]
    # print(address)
    # print(port.name)
    ports.and.data[[1]][i] = port.name
    ports.and.data[[2]][i] = address
  }
  
  # cycle through emea, get port names and shipandbunkers.com url's, append in existing list
  # same extraction logic applies
  for (i in 1:l.emea) {
    address = unlist(str_split(str_extract(emea.content[emea.port.lines[i]], 'http://.*'), '\">'))[1]
    port.name = unlist(str_split(str_extract(emea.content[emea.port.lines[i]], 'http://.*'), '\">'))[2]
    port.name = unlist(str_split(port.name, '</a>'))[1]
    # print(address)
    # print(port.name)
    ports.and.data[[1]][l.americas + i] = port.name
    ports.and.data[[2]][l.americas + i] = address
  }
  
  # cycle through apac, get port names and shipandbunkers.com url's, append in existing list
  # same extraction logic applies
  for (i in 1:l.apac) {
    address = unlist(str_split(str_extract(apac.content[apac.port.lines[i]], 'http://.*'), '\">'))[1]
    port.name = unlist(str_split(str_extract(apac.content[apac.port.lines[i]], 'http://.*'), '\">'))[2]
    port.name = unlist(str_split(port.name, '</a>'))[1]
    # print(address)
    # print(port.name)
    ports.and.data[[1]][l.americas + l.emea + i] = port.name
    ports.and.data[[2]][l.americas + l.emea + i] = address
  }
  
  # snap-preview
  # ports.and.data
  # coerce to data.frame
  ports.and.data = as.data.frame(ports.and.data)
  # snap-preview
  # ports.and.data
  
  return(ports.and.data)
  
}


