event handling
updatePosition: aPosition

	| newPos |
	newPos := aPosition.
	newPos := newPos max: 0 @ 0 - self editor canvasMorph extent.
	newPos := newPos min: 0 @ 0 + self editor canvasMorph extent - self extent.
	
	self position: newPos