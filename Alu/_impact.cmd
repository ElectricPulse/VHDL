loadProjectFile -file "/home/hackerman/ImpactProjects/Main.ipf"
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
setMode -bs
setMode -bs
setMode -bs
setMode -bs
setMode -bs
setCable -port auto
Program -p 1 -onlyFpga 
Program -p 1 -onlyFpga 
assignFile -p 1 -file "/home/hackerman/IseProjects/FourBitAlu/top.bit"
Program -p 1 -onlyFpga 
assignFile -p 1 -file "/home/hackerman/IseProjects/FourBitAlu/top.bit"
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
saveProjectFile -file "/home/hackerman/ImpactProjects/Main.ipf"
setMode -bs
setMode -bs
deleteDevice -position 1
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
