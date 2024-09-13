view
centerViewAt: aPoint
	"Center view at aPoint (in current view)"
	"Note: aPoint is relative to current view"
	"Note: center must induce legal view (non-overlapping)"

	self view moveTo: (self inViewPointToViewCenter: aPoint).
	self updateMap