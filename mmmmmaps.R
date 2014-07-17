load('port_directory.table')
# lookups can be saved, like port_directory.table
# bunkerindex.lookup = create.bunkerindex.lookup()
# bunkerportsnews.lookup = create.bunkerportsnews.lookup()
# marine.news.lookup = create.marine.news.lookup()
# navigatemag.lookup = create.navigatemag.lookup()
# shipandbunker.lookup = create.shipandbunker.lookup()
load('lookup')

bunkerindex.prices = get.bunkerindex.prices()
bunkerportsnews.prices = get.bunkerportsnews.prices.from.table()
marine.news.prices = get.marine.news.prices()
navigatemag.prices = get.navigatemag.prices()
shipandbunker.prices = get.shipandbunker.prices.fast()

port.indices = unique(c(bunkerindex.lookup$pd.line, 
                        bunkerportsnews.lookup$pd.line, 
                        marine.news.lookup$pd.line, 
                        navigatemag.lookup$pd.line, 
                        shipandbunker.lookup$pd.line))

ports = as.character(port_directory.table$port[port.indices])
port.coordinates = cbind(port_directory.table$longitude[port.indices], 
                         port_directory.table$latitude[port.indices])

data.to.plot = list()
length(data.to.plot) = length(port.indices)
for (i in 1:length(data.to.plot)) {
  data.to.plot[[i]][1] = list(port.indices[i])
  data.to.plot[[i]][2] = list(ports[i])
  data.to.plot[[i]][3] = list(port.coordinates[i, 1])
  data.to.plot[[i]][4] = list(port.coordinates[i, 2])
  data.to.plot[[i]][5] = list(bunkerindex.prices[which(bunkerindex.prices$port == ports[i]), ])
  data.to.plot[[i]][6] = list(bunkerportsnews.prices[which(bunkerportsnews.prices$port == ports[i]), ])
  data.to.plot[[i]][7] = list(marine.news.prices[which(marine.news.prices$port == ports[i]), ])
  data.to.plot[[i]][8] = list(navigatemag.prices[which(navigatemag.prices$port == ports[i]), ])
  data.to.plot[[i]][9] = list(shipandbunker.prices[which(shipandbunker.prices$port == ports[i]), ])
  data.to.plot[[i]][10] = list(IFO380 = mean(c(data.to.plot[[i]][[5]]$IFO380, 
                                               data.to.plot[[i]][[6]]$IFO380, 
                                               data.to.plot[[i]][[7]]$IFO380, 
                                               data.to.plot[[i]][[8]]$IFO380, 
                                               data.to.plot[[i]][[9]]$IFO380), 
                                             na.rm = TRUE))
  data.to.plot[[i]][11] = list(IFO180 = mean(c(data.to.plot[[i]][[5]]$IFO180, 
                                               data.to.plot[[i]][[6]]$IFO180, 
                                               data.to.plot[[i]][[7]]$IFO180, 
                                               data.to.plot[[i]][[8]]$IFO180, 
                                               data.to.plot[[i]][[9]]$IFO180), 
                                             na.rm = TRUE))
  data.to.plot[[i]][12] = list(MDO = mean(c(data.to.plot[[i]][[5]]$MDO,
                                            data.to.plot[[i]][[6]]$MDO, 
                                            data.to.plot[[i]][[7]]$MDO, 
                                            data.to.plot[[i]][[8]]$MDO, 
                                            data.to.plot[[i]][[9]]$MDO), 
                                          na.rm = TRUE))
  data.to.plot[[i]][13] = list(MGO = mean(c(data.to.plot[[i]][[5]]$MGO, 
                                            data.to.plot[[i]][[6]]$MGO, 
                                            data.to.plot[[i]][[7]]$MGO, 
                                            data.to.plot[[i]][[8]]$MGO, 
                                            data.to.plot[[i]][[9]]$MGO), 
                                          na.rm = TRUE))
  
  data.to.plot[[i]][14] = list(LS380 = mean(c(data.to.plot[[i]][[5]]$LS380, 
                                              data.to.plot[[i]][[6]]$LS380, 
                                              data.to.plot[[i]][[7]]$LS380, 
                                              data.to.plot[[i]][[8]]$LS380, 
                                              data.to.plot[[i]][[9]]$LS380), 
                                            na.rm = TRUE))
  data.to.plot[[i]][15] = list(LS180 = mean(c(data.to.plot[[i]][[5]]$LS180, 
                                              data.to.plot[[i]][[6]]$LS180, 
                                              data.to.plot[[i]][[7]]$LS180, 
                                              data.to.plot[[i]][[8]]$LS180, 
                                              data.to.plot[[i]][[9]]$LS180), 
                                            na.rm = TRUE))
  data.to.plot[[i]][16] = list(LSMDO = mean(c(data.to.plot[[i]][[5]]$LSMDO,
                                              data.to.plot[[i]][[6]]$LSMDO, 
                                              data.to.plot[[i]][[7]]$LSMDO, 
                                              data.to.plot[[i]][[8]]$LSMDO, 
                                              data.to.plot[[i]][[9]]$LSMDO), 
                                            na.rm = TRUE))
  data.to.plot[[i]][17] = list(LSMGO = mean(c(data.to.plot[[i]][[5]]$LSMGO, 
                                              data.to.plot[[i]][[6]]$LSMGO, 
                                              data.to.plot[[i]][[7]]$LSMGO, 
                                              data.to.plot[[i]][[8]]$LSMGO, 
                                              data.to.plot[[i]][[9]]$LSMGO), 
                                            na.rm = TRUE))
  
}

IFO380 = vector(mode = 'numeric', length = length(port.indices))
IFO180 = vector(mode = 'numeric', length = length(port.indices))
MDO = vector(mode = 'numeric', length = length(port.indices))
MGO = vector(mode = 'numeric', length = length(port.indices))
LS380 = vector(mode = 'numeric', length = length(port.indices))
LS180 = vector(mode = 'numeric', length = length(port.indices))
LSMDO = vector(mode = 'numeric', length = length(port.indices))
LSMGO = vector(mode = 'numeric', length = length(port.indices))

for (i in 1:length(port.indices)) {
  IFO380[i] = as.numeric(data.to.plot[[i]][[10]])
  IFO180[i] = as.numeric(data.to.plot[[i]][[11]])
  MDO[i] = as.numeric(data.to.plot[[i]][[12]])
  MGO[i] = as.numeric(data.to.plot[[i]][[13]])
  LS380[i] = as.numeric(data.to.plot[[i]][[14]])
  LS180[i] = as.numeric(data.to.plot[[i]][[15]])
  LSMDO[i] = as.numeric(data.to.plot[[i]][[16]])
  LSMGO[i] = as.numeric(data.to.plot[[i]][[17]])
}


library(rworldmap)
library(rworldxtra)
library(maps)
library(plotrix)


source('~/NewBunker/northeurope.R')
source('~/NewBunker/mediterranean.R')
source('~/NewBunker/africa.R')
source('~/NewBunker/meandia.R')
source('~/NewBunker/seasia.R')
source('~/NewBunker/japan.R')
source('~/NewBunker/latam.R')
source('~/NewBunker/uspac.R')
source('~/NewBunker/usgulf.R')
source('~/NewBunker/usatlantic.R')
source('~/NewBunker/aussie.R')








