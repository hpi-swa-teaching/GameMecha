view
moveViewBy: aPoint
	"Move view by absoulte distance induced by aPoint"
	"Note: aPoint is relative to current view"
	"Note: center must induce legal view (non-overlapping)"

	self view moveBy: (self absPointToViewFraction: (aPoint / self viewScaleFactor)).
	self updateMap