view-conversion
absPointToViewCenter: aPoint
	"Transform aPoint (without zoom) such that the transformation induces a view origin so that aPoint lies in the center"

	^ (self absPointToViewFraction: aPoint) - (self view extent / 2) 