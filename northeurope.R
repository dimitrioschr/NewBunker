# North Europe
pdf('northeurope.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(-10, 30), ylim = c(50, 60), asp = 2, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 25), labels = ports, cex = 0.5, col = 'white')
dev.off()
