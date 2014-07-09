create.bunkerindex.lookup = function() {
  
  
  bunkerindex.table.new = get.bunkerindex.prices()
  load('port_directory.table')
  
  
  bunkerindex.table.new.lookup = list()
  length(bunkerindex.table.new.lookup) = 
    length(bunkerindex.table.new$port)
  
  for (i in 1:length(bunkerindex.table.new$port)) {
    lookup.value = which(port_directory.table$port == bunkerindex.table.new$port[i])
    if (!(length(lookup.value) == 0)) {
      bunkerindex.table.new.lookup[[i]] = lookup.value
    } else {
      bunkerindex.table.new.lookup[[i]] = NA
    }
  }
  
#   bunkerindex.table.new.lookup
#   
#   which(sapply(bunkerindex.table.new.lookup, length) > 1)
#   which(sapply(bunkerindex.table.new.lookup, 
#               function(x) {ifelse(length(x) == 1, 
#                                   yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
#                                   no = FALSE)}) == 1)
  
  
  bunkerindex.lookup = vector('numeric', 
                              length(bunkerindex.table.new.lookup))
  
  for (i in 1:length(bunkerindex.table.new.lookup)) {
    if (length(bunkerindex.table.new.lookup[[i]]) > 1) {
      bunkerindex.lookup[i] = 9999
    } else if (is.na(bunkerindex.table.new.lookup[[i]])) {
      bunkerindex.lookup[i] = 0
    } else {
      bunkerindex.lookup[i] = bunkerindex.table.new.lookup[[i]]
    }
  }
  
#   sum(bunkerindex.lookup == 0)
#   which(bunkerindex.lookup == 0)
#   bunkerindex.table.new$port[which(bunkerindex.lookup == 0)]
#   sum(bunkerindex.lookup == 9999)
#   which(bunkerindex.lookup == 9999)
#   bunkerindex.table.new$port[which(bunkerindex.lookup == 9999)]
  
  bunkerindex.lookup = 
    data.frame(bunkerindex.port = bunkerindex.table.new$port, 
               pd.line = bunkerindex.lookup, 
               stringsAsFactors = FALSE)

return(bunkerindex.lookup)
  
}