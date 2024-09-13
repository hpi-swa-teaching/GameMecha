conversion
correctedTilePositionBackground: aPoint
	"Transform background tile positions correctly (as the stack is larger it has a different starting offset)"
	
	^ self correctedTilePosition: aPoint startingOffset: self tileCornerOffsetBackground