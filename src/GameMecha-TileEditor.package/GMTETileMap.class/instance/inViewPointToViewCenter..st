view-conversion
inViewPointToViewCenter: aPoint
	"Transform a view point such that the transformation induces a view origin so that aPoint lies in the center"

	^ (self inViewPointToViewFraction: aPoint) - (self view extent / 2)