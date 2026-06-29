handels
dragTopLeftEvent: evt

	| delta fixedCorner absoluteCursor |
	delta := evt hand position - self dragOffset / self editor canvasMorph scaleFactor.
	fixedCorner := self dragStartBounds corner.
	absoluteCursor := self dragStartBounds origin + delta min: fixedCorner.
	self updateBounds: (Rectangle origin: absoluteCursor corner: fixedCorner).
	self placeHandles