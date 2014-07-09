# Mediterranean
### prefer the Black sea version
pdf('mediterranean.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(-20, 35), ylim = c(35, 40), asp = 1.5, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 50), labels = ports, cex = 0.5, col = 'white')
dev.off()


# Mediterranean and Black Sea
pdf('medblacksea.pdf', width = 8, height = 6)
map = getMap(resolution = 'high')
plot(map, xlim = c(-20, 45), ylim = c(35, 40), asp = 1.5, 
     bg = 'lightblue', col = 'steelblue')
points(port.coordinates, pch = 20, cex = 2 , col = 2)
text(jitter(port.coordinates, factor = 50), labels = ports, cex = 0.5, col = 'white')
dev.off()
