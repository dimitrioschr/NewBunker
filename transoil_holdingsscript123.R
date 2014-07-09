library(XML)
library(stringr)

checker = readLines('http://www.transoil-holdings.com/')

bunkers.table = readHTMLTable(checker, header=TRUE, which=1,stringsAsFactors=F)
# bunkers.table

bunkers.vector = (bunkers.table[12:23, 1:5])
bunkers.vector

bunkers = as.data.frame(bunkers.vector)
class(bunkers[, 1])

for (i in 2:5) {
  for (j in 1:12) {
    temp = unlist(str_extract_all(bunkers[j, i], '[-+]?[0-9]*\\.?[0-9]*'))
    bunkers[j, i] = as.numeric(as.character(temp[length(temp)]))
  }
}

# str_extract_all(
#   bunkers[6, 5], 
#   '[-+]?[0-9]*\\.?[0-9]*'
# )
# 
# bunkers.vector[6, 5]
