# Japan
pdf('japan.pdf', width = 8, height = 8)
map = getMap(resolution = 'high')
plot(map, xlim = c(120, 165), ylim = c(15, 60), asp = 1, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 20), labels = ports, cex = 0.5, col = 'white')
dev.off()
