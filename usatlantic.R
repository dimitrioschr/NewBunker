# US Atlantic
pdf('usatlantic.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(-105, -60), ylim = c(30, 60), asp = 1.5, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 50), labels = ports, cex = 0.5, col = 'white')
dev.off()
