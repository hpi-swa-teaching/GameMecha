view-conversion
inViewPointToAbs: aPoint
	"Transform a view point such that it is mapped into the reference view (no zoom) value domain"

	^ (self viewOriginInPxl - self topLeft) + (aPoint / self viewScaleFactor) 