tile map
rescaleGridDimensions: aPoint
	
	(self getGridWidth = aPoint x)	ifFalse: [self rescaleGridWidth: aPoint x].
	(self getGridHeight = aPoint y) ifFalse: [self rescaleGridHeight: aPoint y].