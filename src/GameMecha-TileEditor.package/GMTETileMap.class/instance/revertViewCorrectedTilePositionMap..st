view-conversion
revertViewCorrectedTilePositionMap: aPoint
	"comment stating purpose of message"

	^ self revertCorrectedTilePositionMap: (self revertViewCorrectedTilePosition: aPoint)