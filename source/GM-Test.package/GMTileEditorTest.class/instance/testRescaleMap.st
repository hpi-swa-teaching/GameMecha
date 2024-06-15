as yet unclassified
testRescaleMap
	self editor ifNil:
		[self setup].
	self editor tileMapMatrix rescaleMapWidth: 12 height: 13.
	self assert: self editor tileMapMatrix mapTileWidth = 12.
	self assert: self editor tileMapMatrix mapTileHeight = 13.