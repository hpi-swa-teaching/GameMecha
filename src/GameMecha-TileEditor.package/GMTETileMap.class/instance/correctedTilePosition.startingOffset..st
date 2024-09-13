conversion
correctedTilePosition: aPoint startingOffset: anOffset
	"Transform a tile position by adding a starting offset"
	
	^ (aPoint + anOffset + self topLeft) floor	