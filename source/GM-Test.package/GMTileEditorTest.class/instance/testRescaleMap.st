as yet unclassified
testRescaleMap
	"tests the rescaling of the maps dimensions"
	
	self editor tileMap rescaleMapWidth: 12 height: 13.
	self assert: self editor tileMap mapTileWidth = 12.
	self assert: self editor tileMap mapTileHeight = 13