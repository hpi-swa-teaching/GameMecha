as yet unclassified
testRescaleMap

	self editor tileMap rescaleMapWidth: 12 height: 13.
	self assert: self editor tileMap mapTileWidth = 12.
	self assert: self editor tileMap mapTileHeight = 13