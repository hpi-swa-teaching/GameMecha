handels
dragBottomRightEvent: evt

	| delta fixedCorner absoluteCursor |
	delta := evt hand position - self dragOffset / self editor canvasMorph scaleFactor.
	fixedCorner := self dragStartBounds origin.
	absoluteCursor := self dragStartBounds corner + delta max: fixedCorner.
	self updateBounds: (Rectangle origin: fixedCorner corner: absoluteCursor).
	self placeHandles