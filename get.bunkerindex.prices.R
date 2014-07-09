get.bunkerindex.prices = function() {
  
  
  library(XML)
  library(stringr)
  
  # define "constants"
  page1 = 'http://www.bunkerindex.com/prices/africa.php'
  page2 = 'http://www.bunkerindex.com/prices/asia.php'
  page3 = 'http://www.bunkerindex.com/prices/lamerica.php'
  page4 = 'http://www.bunkerindex.com/prices/meast.php'
  page5 = 'http://www.bunkerindex.com/prices/namerica.php'
  page6 = 'http://www.bunkerindex.com/prices/neurope.php'
  page7 = 'http://www.bunkerindex.com/prices/seurope.php'
  
  names.vector = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO', 
                   'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  
  # read - in first page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
  bunkers.table = readHTMLTable(page1, header=T,stringsAsFactors=F)
  bunkers.table = cbind(bunkers.table[[7]], bunkers.table[[8]], bunkers.table[[9]], bunkers.table[[10]])
  no.new.ports = dim(bunkers.table)[1]
  table.length = length(bunkers.table)
  bunkers.table = bunkers.table[, 1:(table.length - 2)]
  names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
  names(bunkers.table)[1] = 'port'
  table.length = length(bunkers.table)
  table.names = names(bunkers.table)
  for (i in 2:table.length) {
    if (str_detect(table.names[i], 'LS')) {
      table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
    }
    for (j in 1:no.new.ports) {
      bunkers.table[j, i] = as.numeric(unlist(str_split(bunkers.table[j, i], ' '))[1])
    }
  }
  
  # initialise bunkerindex.table to necessary number of port rows
  bunkerindex.table = as.data.frame(matrix(nrow = no.new.ports, ncol = 9))
  names(bunkerindex.table) = names.vector
  
  # get the fields for which a name already exists
  for (i in 1:no.new.ports) {
    for (j in 1:table.length) {
      bunkerindex.table[i, table.names[j]] = bunkers.table[i, table.names[j]]
    }
  }
  
  
  # read - in second page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
  bunkers.table = readHTMLTable(page2, header=T,stringsAsFactors=F)
  bunkers.table = cbind(bunkers.table[[6]], bunkers.table[[7]], bunkers.table[[8]], bunkers.table[[9]])
  no.new.ports = dim(bunkers.table)[1]
  table.length = length(bunkers.table)
  bunkers.table = bunkers.table[, 1:(table.length - 2)]
  names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
  names(bunkers.table)[1] = 'port'
  table.length = length(bunkers.table)
  table.names = names(bunkers.table)
  for (i in 2:table.length) {
    if (str_detect(table.names[i], 'LS')) {
      table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
    }
    for (j in 1:no.new.ports) {
      bunkers.table[j, i] = as.numeric(unlist(str_split(bunkers.table[j, i], ' '))[1])
    }
  }
  names(bunkers.table) = table.names
  
  # append the necessary number of port rows
  add.data.frame = as.data.frame(matrix(nrow = no.new.ports, ncol = 9))
  names(add.data.frame) = names.vector
  
  # get the fields for which a name already exists
  for (i in 1:no.new.ports) {
    for (j in 1:table.length) {
      add.data.frame[i, table.names[j]] = bunkers.table[i, table.names[j]]
    }
  }
  
  bunkerindex.table = rbind(bunkerindex.table, add.data.frame)
  
  
  # read - in third page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
  bunkers.table = readHTMLTable(page3, header=T,stringsAsFactors=F)
  bunkers.table = cbind(bunkers.table[[6]], bunkers.table[[7]], bunkers.table[[8]], bunkers.table[[9]])
  no.new.ports = dim(bunkers.table)[1]
  table.length = length(bunkers.table)
  bunkers.table = bunkers.table[, 1:(table.length - 2)]
  names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
  names(bunkers.table)[1] = 'port'
  table.length = length(bunkers.table)
  table.names = names(bunkers.table)
  for (i in 2:table.length) {
    if (str_detect(table.names[i], 'LS')) {
      table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
    }
    for (j in 1:no.new.ports) {
      bunkers.table[j, i] = as.numeric(unlist(str_split(bunkers.table[j, i], ' '))[1])
    }
  }
  names(bunkers.table) = table.names
  
  # append the necessary number of port rows
  add.data.frame = as.data.frame(matrix(nrow = no.new.ports, ncol = 9))
  names(add.data.frame) = names.vector
  
  # get the fields for which a name already exists
  for (i in 1:no.new.ports) {
    for (j in 1:table.length) {
      add.data.frame[i, table.names[j]] = bunkers.table[i, table.names[j]]
    }
  }
  
  bunkerindex.table = rbind(bunkerindex.table, add.data.frame)
  
  
  # read - in fourth page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
  bunkers.table = readHTMLTable(page4, header=T,stringsAsFactors=F)
  bunkers.table = cbind(bunkers.table[[6]], bunkers.table[[7]], bunkers.table[[8]])
  no.new.ports = dim(bunkers.table)[1]
  table.length = length(bunkers.table)
  bunkers.table = bunkers.table[, 1:(table.length - 2)]
  names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
  names(bunkers.table)[1] = 'port'
  table.length = length(bunkers.table)
  table.names = names(bunkers.table)
  for (i in 2:table.length) {
    if (str_detect(table.names[i], 'LS')) {
      table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
    }
    for (j in 1:no.new.ports) {
      bunkers.table[j, i] = as.numeric(unlist(str_split(bunkers.table[j, i], ' '))[1])
    }
  }
  names(bunkers.table) = table.names
  
  # append the necessary number of port rows
  add.data.frame = as.data.frame(matrix(nrow = no.new.ports, ncol = 9))
  names(add.data.frame) = names.vector
  
  # get the fields for which a name already exists
  for (i in 1:no.new.ports) {
    for (j in 1:table.length) {
      add.data.frame[i, table.names[j]] = bunkers.table[i, table.names[j]]
    }
  }
  
  bunkerindex.table = rbind(bunkerindex.table, add.data.frame)
  
  
  # read - in fifth page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
  bunkers.table = readHTMLTable(page5, header=T,stringsAsFactors=F)
  bunkers.table = cbind(bunkers.table[[6]], bunkers.table[[7]], bunkers.table[[8]], bunkers.table[[9]])
  no.new.ports = dim(bunkers.table)[1]
  table.length = length(bunkers.table)
  bunkers.table = bunkers.table[, 1:(table.length - 2)]
  names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
  names(bunkers.table)[1] = 'port'
  table.length = length(bunkers.table)
  table.names = names(bunkers.table)
  for (i in 2:table.length) {
    if (str_detect(table.names[i], 'LS')) {
      table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
    }
    for (j in 1:no.new.ports) {
      bunkers.table[j, i] = as.numeric(unlist(str_split(bunkers.table[j, i], ' '))[1])
    }
  }
  names(bunkers.table) = table.names
  
  # append the necessary number of port rows
  add.data.frame = as.data.frame(matrix(nrow = no.new.ports, ncol = 9))
  names(add.data.frame) = names.vector
  
  # get the fields for which a name already exists
  for (i in 1:no.new.ports) {
    for (j in 1:table.length) {
      add.data.frame[i, table.names[j]] = bunkers.table[i, table.names[j]]
    }
  }
  
  bunkerindex.table = rbind(bunkerindex.table, add.data.frame)
  
  
  # read - in sixth page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
  bunkers.table = readHTMLTable(page6, header=T,stringsAsFactors=F)
  bunkers.table = cbind(bunkers.table[[6]], bunkers.table[[7]], bunkers.table[[8]], bunkers.table[[9]], bunkers.table[[10]], bunkers.table[[11]])
  no.new.ports = dim(bunkers.table)[1]
  table.length = length(bunkers.table)
  bunkers.table = bunkers.table[, 1:(table.length - 2)]
  names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
  names(bunkers.table)[1] = 'port'
  table.length = length(bunkers.table)
  table.names = names(bunkers.table)
  for (i in 2:table.length) {
    if (str_detect(table.names[i], 'LS')) {
      table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
    }
    for (j in 1:no.new.ports) {
      bunkers.table[j, i] = as.numeric(unlist(str_split(bunkers.table[j, i], ' '))[1])
    }
  }
  names(bunkers.table) = table.names
  
  # append the necessary number of port rows
  add.data.frame = as.data.frame(matrix(nrow = no.new.ports, ncol = 9))
  names(add.data.frame) = names.vector
  
  # get the fields for which a name already exists
  for (i in 1:no.new.ports) {
    for (j in 1:table.length) {
      add.data.frame[i, table.names[j]] = bunkers.table[i, table.names[j]]
    }
  }
  
  bunkerindex.table = rbind(bunkerindex.table, add.data.frame)
  
  
  # read - in seventh page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
  bunkers.table = readHTMLTable(page7, header=T,stringsAsFactors=F)
  bunkers.table = cbind(bunkers.table[[6]], bunkers.table[[7]], bunkers.table[[8]], bunkers.table[[9]], bunkers.table[[10]])
  no.new.ports = dim(bunkers.table)[1]
  table.length = length(bunkers.table)
  bunkers.table = bunkers.table[, 1:(table.length - 2)]
  names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
  names(bunkers.table)[1] = 'port'
  table.length = length(bunkers.table)
  table.names = names(bunkers.table)
  for (i in 2:table.length) {
    if (str_detect(table.names[i], 'LS')) {
      table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
    }
    for (j in 1:no.new.ports) {
      bunkers.table[j, i] = as.numeric(unlist(str_split(bunkers.table[j, i], ' '))[1])
    }
  }
  names(bunkers.table) = table.names
  
  # append the necessary number of port rows
  add.data.frame = as.data.frame(matrix(nrow = no.new.ports, ncol = 9))
  names(add.data.frame) = names.vector
  
  # get the fields for which a name already exists
  for (i in 1:no.new.ports) {
    for (j in 1:table.length) {
      add.data.frame[i, table.names[j]] = bunkers.table[i, table.names[j]]
    }
  }
  
  bunkerindex.table = rbind(bunkerindex.table, add.data.frame)
  
  for (i in 2:9) {
    
    bunkerindex.table[, i] = as.numeric(bunkerindex.table[, i])
    
  }
  
  return(bunkerindex.table)
  
}