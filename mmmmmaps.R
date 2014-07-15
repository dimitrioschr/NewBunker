load('port_directory.table')
# lookups can be saved, like port_directory.table
bunkerindex.lookup = create.bunkerindex.lookup()
bunkerportsnews.lookup = create.bunkerportsnews.lookup()
marine.news.lookup = create.marine.news.lookup()
navigatemag.lookup = create.navigatemag.lookup()
shipandbunker.lookup = create.shipandbunker.lookup()

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

# North Europe

majors = c(
  1141, 
  2078, 
  1038, 
  155, 
  3425, 
  124, 
  3738, 
  1325, 
  1264, 
  3951, 
  3818)

pdf('northeurope.pdf', width = 10, height = 7)
map = getMap(resolution = 'high')
long.left.limit = -10
long.right.limit = 30
lat.bottom.limit = 50
lat.top.limit = 60

plot(map, 
     xlim = c(long.left.limit, long.right.limit), 
     ylim = c(lat.bottom.limit, lat.top.limit), 
     asp = 2, 
     bg = 'lightblue', 
     col = 'steelblue')

points(port.coordinates[which(port.indices %in% majors), ], pch = 20, cex = 2 , col = 2)
textbox(c(-8,-4), 52.5, paste("Falmouth", 
                          "\n ", round(IFO380[which(ports == 'Falmouth')], 1), 
                          "\n ", round(IFO180[which(ports == 'Falmouth')], 1), 
                          "\n ", round(MDO[which(ports == 'Falmouth')], 1), 
                          "\n ", round(MGO[which(ports == 'Falmouth')], 1)
                          ), 
        justify = 'c', 
        fill = 'white'
        )
text()
dev.off()

# Mediterranean
pdf('mediterranean.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(-20, 35), ylim = c(35, 40), asp = 1.5, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()

# Mediterranean and Black Sea
pdf('medblacksea.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(-20, 45), ylim = c(35, 40), asp = 1.5, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()

# Africa
pdf('africa.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(-10, 40), ylim = c(-40, 40), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()

# MidEast, India, Piracy
pdf('meandia.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(30, 100), ylim = c(-10, 30), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()

# SEAsia
pdf('seasia.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(90, 135), ylim = c(-15, 30), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()


# Japan
pdf('japan.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(120, 165), ylim = c(15, 60), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()

# Aussie
pdf('aussie.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(105, 165), ylim = c(-45, 0), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()

# US Atlantic
pdf('usatlantic.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(-105, -60), ylim = c(30, 60), asp = 1.5, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 50), labels = ports, cex = 0.5, col = 'white')
dev.off()


# US Gulf
pdf('usgulf.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(-105, -60), ylim = c(15, 30), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 50), labels = ports, cex = 0.5, col = 'white')
dev.off()

# US Pacific
pdf('uspacific.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(-135, -105), ylim = c(30, 50), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
dev.off()


# Latin America
pdf('latam.pdf', width = 6, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(-85, -35), ylim = c(-45, 5), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 50), labels = ports, cex = 0.25, col = 'white')
dev.off()

