library(XML)
library(stringr)

checker = readLines('http://www.transoil-holdings.com/templ.php?catid=369')

bunkers.table = readHTMLTable(checker, header=F, which=1,stringsAsFactors=F)
bunkers.table

bunkers.vector = (bunkers.table[13:25, 1:5])
bunkers.vector

bunkers = as.data.frame(bunkers.vector)
class(bunkers[, 1])

# Camelise
bunkers[, 1] = sub('^(\\w?)', '\\U\\1', tolower(bunkers[, 1]), perl=T)

bunkers[, 1] = sub('^(\\w?)', '\\U\\1', bunkers[, 1], perl=T)
bunkers[, 1] = gsub(' (\\w?)', ' \\U\\1', bunkers[, 1], perl=T)


bunkers[, 1]


for (i in 2:5) {
  for (j in 1:13) {
    temp = unlist(str_extract_all(bunkers[j, i], '[-+]?[0-9]*\\.?[0-9]*'))
    bunkers[j, i] = as.numeric(as.character(temp[length(temp)]))
  }
}

bunkers



