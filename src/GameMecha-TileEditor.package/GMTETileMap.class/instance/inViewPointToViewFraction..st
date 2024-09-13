view-conversion
inViewPointToViewFraction: aPoint
	"Transform a view point such that it is mapped into the view value domain (e.g. 0-1)"

	^ self absPointToViewFraction: (self inViewPointToAbs: aPoint)