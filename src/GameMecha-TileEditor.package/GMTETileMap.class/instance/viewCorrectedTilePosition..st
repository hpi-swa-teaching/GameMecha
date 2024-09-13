view-conversion
viewCorrectedTilePosition: aPoint
	"Transform aPoint such that it accounts for zoom/view"

	^ self viewScaleFactor * (aPoint - self viewOriginInPxl) + self topLeft