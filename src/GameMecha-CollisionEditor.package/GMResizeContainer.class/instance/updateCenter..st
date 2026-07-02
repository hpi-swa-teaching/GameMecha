event handling
updateCenter: aPoint

	| newCenter |
	newCenter := aPoint.
	newCenter := newCenter max: 0 @ 0 - self editor canvasMorph extent.
	newCenter := newCenter min: 0 @ 0 + self editor canvasMorph extent - self extent.
	
	self center: newCenter