# SEAsia

majors = c(1533, 1803, 1766, 2890, 3039, 3720)

pdf('seasia.pdf', width = 7, height = 10)
map = getMap(resolution = 'high')
long.left.limit = 90
long.right.limit = 135
lat.bottom.limit = -15
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
     labels = paste0('\n ', 
                     '      ', 
                     ports[major.port.indices[1]], 
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
                     as.character(round(MGO[major.port.indices[2]], 1))
                     ),
     cex = 1, 
     col = 'white', 
     pos = 4)

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
                     as.character(round(MGO[major.port.indices[3]], 1)), 
                     '                                                        '
     ),
     cex = 1, 
     col = 'white', 
     pos = 3)

text(port.coordinates[major.port.indices, ][4, 1], 
     port.coordinates[major.port.indices, ][4, 2], 
     labels = paste0(ports[major.port.indices[4]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[4]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[4]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[4]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[4]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = 4)

text(port.coordinates[major.port.indices, ][5, 1], 
     port.coordinates[major.port.indices, ][5, 2], 
     labels = paste0(ports[major.port.indices[5]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[5]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[5]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[5]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[5]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = 4)

text(port.coordinates[major.port.indices, ][6, 1], 
     port.coordinates[major.port.indices, ][6, 2], 
     labels = paste0('      ', 
                     ports[major.port.indices[6]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[6]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[6]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[6]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[6]], 1)), 
                     '\n '
     ),
     cex = 1, 
     col = 'white', 
     pos = 3)


dev.off()
