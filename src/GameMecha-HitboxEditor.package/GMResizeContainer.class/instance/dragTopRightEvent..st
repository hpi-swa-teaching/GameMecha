handels
dragTopRightEvent: evt

	| delta left bottom newTop newRight |
	delta := evt hand position - self dragOffset / self editor canvasMorph scaleFactor.
	left := self dragStartBounds left.
	bottom := self dragStartBounds bottom.
	newTop := self dragStartBounds top + delta y min: bottom.
	newRight := self dragStartBounds right + delta x max: left.
	self updateBounds: (Rectangle origin: left @ newTop corner: newRight @ bottom).
	self placeHandles