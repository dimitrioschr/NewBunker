# North Europe

majors = c( 1141, 2078, 1038, 155, 3425, 124, 1325, 1264, 3951, 3818)

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

major.port.indices = which(port.indices %in% majors)

points(port.coordinates[major.port.indices, ], 
       pch = 20, 
       cex = 2 , 
       col = 2)

points(port.coordinates[major.port.indices, ], 
       pch = 1, 
       cex = 2 , 
       col = 1)

text(port.coordinates[major.port.indices, ][1:10, 1], 
     port.coordinates[major.port.indices, ][1:10, 2],
     labels = paste0(ports[major.port.indices[1:10]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[1:10]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[1:10]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[1:10]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[1:10]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = c(4, 4, 4, 1, 1, 1, 1, 2, 1, 1))





dev.off()
