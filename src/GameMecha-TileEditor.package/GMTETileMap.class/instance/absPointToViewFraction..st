view-conversion
absPointToViewFraction: aPoint
	"Transform aPoint (without zoom) such that it is mapped into the view value domain (e.g. 0-1)"

	^aPoint / self extent