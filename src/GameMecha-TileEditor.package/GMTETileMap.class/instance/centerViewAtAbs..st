view
centerViewAtAbs: aPoint
	"Center view at aPoint (without zoom)"
	"Note: center must induce legal view (non-overlapping)"

	self view moveTo: (self absPointToViewCenter: aPoint).
	self updateMap