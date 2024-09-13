tile map
rescaleGridWidth: aValue
	
	self tileMap rescaleMapWidth: aValue height: self getGridHeight.
	self changed: #getGridWidthAsString