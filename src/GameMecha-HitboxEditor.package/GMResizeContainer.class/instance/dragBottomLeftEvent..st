handels
dragBottomLeftEvent: evt

	| delta top right newBottom newLeft |
	delta := evt hand position - self dragOffset / self editor canvasMorph scaleFactor.
	top := self dragStartBounds top.
	right := self dragStartBounds right.
	newBottom := self dragStartBounds bottom + delta y max: top.
	newLeft := self dragStartBounds left + delta x min: right.
	self updateBounds: (Rectangle origin: newLeft @ top corner: right @ newBottom).
	self placeHandles