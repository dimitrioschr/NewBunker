# Mediterranean and Black Sea

majors = c(3968, 704, 92, 1291, 2063, 222, 4225, 1745, 3070, 3874, 1653, 2694)

pdf('medblacksea.pdf', width = 10, height = 7)
map = getMap(resolution = 'high')
long.left.limit = -20
long.right.limit = 45
lat.bottom.limit = 35
lat.top.limit = 40

plot(map, 
     xlim = c(long.left.limit, long.right.limit), 
     ylim = c(lat.bottom.limit, lat.top.limit), 
     asp = 1.5, 
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
     pos = 3)

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
     pos = 1)

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
     pos = 3)

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
                     as.character(round(MGO[major.port.indices[6]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)

text(port.coordinates[major.port.indices, ][7, 1], 
     port.coordinates[major.port.indices, ][7, 2], 
     labels = paste0(ports[major.port.indices[7]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[7]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[7]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[7]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[7]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = 4)

text(port.coordinates[major.port.indices, ][8, 1], 
     port.coordinates[major.port.indices, ][8, 2], 
     labels = paste0(ports[major.port.indices[8]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[8]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[8]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[8]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[8]], 1))
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)

text(port.coordinates[major.port.indices, ][9, 1], 
     port.coordinates[major.port.indices, ][9, 2], 
     labels = paste0(ports[major.port.indices[9]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[9]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[9]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[9]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[9]], 1)), 
                     '      '
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)

text(port.coordinates[major.port.indices, ][10, 1], 
     port.coordinates[major.port.indices, ][10, 2], 
     labels = paste0(ports[major.port.indices[10]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[10]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[10]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[10]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[10]], 1)), 
                     '      '
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)

text(port.coordinates[major.port.indices, ][11, 1], 
     port.coordinates[major.port.indices, ][11, 2], 
     labels = paste0(ports[major.port.indices[11]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[11]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[11]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[11]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[11]], 1)), 
                     '      '
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)

text(port.coordinates[major.port.indices, ][12, 1], 
     port.coordinates[major.port.indices, ][12, 2], 
     labels = paste0('\n ', 
                     ports[major.port.indices[12]], 
                     ': ', 
                     as.character(round(IFO380[major.port.indices[12]], 1)), 
                     ', ', 
                     as.character(round(IFO180[major.port.indices[12]], 1)), 
                     ', ', 
                     as.character(round(MDO[major.port.indices[12]], 1)), 
                     ', ', 
                     as.character(round(MGO[major.port.indices[12]], 1)), 
                     '      '
     ),
     cex = 1, 
     col = 'white', 
     pos = 1)


dev.off()
