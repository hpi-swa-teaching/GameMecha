view-conversion
revertViewCorrectedTilePosition: aPoint
	"comment stating purpose of message"

	^ (aPoint - self topLeft) / self viewScaleFactor + self viewOriginInPxl