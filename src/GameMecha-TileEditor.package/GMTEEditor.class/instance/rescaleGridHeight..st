tile map
rescaleGridHeight: aValue
	
	self tileMap rescaleMapWidth: self getGridWidth height: aValue.
	self changed: #getGridHeightAsString