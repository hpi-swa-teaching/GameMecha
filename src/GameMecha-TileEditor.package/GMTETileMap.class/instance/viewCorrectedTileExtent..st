view-conversion
viewCorrectedTileExtent: anExtent
	"Transform anExtent such that it accounts for zoom/view"

	^self viewScaleFactor * anExtent