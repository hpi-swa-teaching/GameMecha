dev-api
atTileCoordinates: aPoint
	"Returns the top left corner of a given tile in tile coordinates"
	
	^ self correctedTilePositionMap: (self tilePosFromVirtual: aPoint)