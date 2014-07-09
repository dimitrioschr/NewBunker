load('port_directory.table')
bunkerindex.lookup = create.bunkerindex.lookup()
bunkerportsnews.lookup = create.bunkerportsnews.lookup()
marine.news.lookup = create.marine.news.lookup()
navigatemag.lookup = create.navigatemag.lookup()
shipandbunker.lookup = create.shipandbunker.lookup()

port.indices = unique(c(bunkerindex.lookup$pd.line, 
                        bunkerportsnews.lookup$pd.line, 
                        marine.news.lookup$pd.line, 
                        navigatemag.lookup$pd.line, 
                        shipandbunker.lookup$pd.line))

ports = as.character(port_directory.table$port[port.indices])
port.coordinates = cbind(port_directory.table$longitude[port.indices], 
                         port_directory.table$latitude[port.indices])

library(rworldmap)
library(rworldxtra)
library(maps)

# North Europe
pdf('northeurope.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(-10, 30), ylim = c(50, 60), asp = 2, 
       bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 10), labels = ports, cex = 0.5)
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

