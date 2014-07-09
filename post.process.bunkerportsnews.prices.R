post.process.bunkerportsnews.prices = function(bunkerportsnews.table) {
  
  bunkerportsnews.table = bunkerportsnews.table[
    bunkerportsnews.table$has.prices, c(1, 3:6)]
  
  bunkerportsnews.table = bunkerportsnews.table[
    which(rowSums(is.na(bunkerportsnews.table)) != 4), ]
  
  to.add = matrix(nrow = dim(bunkerportsnews.table)[1], ncol = 4)
  to.add = as.data.frame(to.add)
  bunkerportsnews.table = cbind(bunkerportsnews.table, to.add)
  for (i in 6:9) {
    bunkerportsnews.table[, i] = as.numeric(bunkerportsnews.table[, i])
  }
  
  names(bunkerportsnews.table) = c(
    'port', 'IFO380', 'IFO180', 'MDO', 'MGO', 
    'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  return(bunkerportsnews.table)
  
}