# MidEast, India, Piracy

majors = c(1685, 1220, 810)

pdf('meandia.pdf', width = 10, height = 7)
map = getMap(resolution = 'high')
long.left.limit = 30
long.right.limit = 100
lat.bottom.limit = -10
lat.top.limit = 30

plot(map, 
     xlim = c(long.left.limit, long.right.limit), 
     ylim = c(lat.bottom.limit, lat.top.limit), 
     asp = 1, 
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

text(port.coordinates[major.port.indices, ][1, 1], 
     port.coordinates[major.port.indices, ][1, 2], 
     labels = paste0(ports[major.port.indices[1]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[1]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[1]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[1]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[1]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)

text(port.coordinates[major.port.indices, ][2, 1], 
     port.coordinates[major.port.indices, ][2, 2], 
     labels = paste0(ports[major.port.indices[2]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[2]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[2]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[2]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[2]], 1)), 
                     '\n '
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)

text(port.coordinates[major.port.indices, ][3, 1], 
     port.coordinates[major.port.indices, ][3, 2], 
     labels = paste0(ports[major.port.indices[3]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[3]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[3]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[3]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[3]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)


dev.off()
