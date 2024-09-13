view
zoomAt: aPoint by: aFloat
	
	| newCenter oldMouseCenterOffset aPointAbs oldScaleFactor |
	oldScaleFactor := self viewScaleFactor.
	aPointAbs := self inViewPointToAbs: aPoint.
	oldMouseCenterOffset := (self inViewPointToAbs: (self extent / 2)) - aPointAbs.

	self view changeSizeBy: (aFloat negated).

	newCenter := (oldScaleFactor / self viewScaleFactor) * oldMouseCenterOffset + aPointAbs.
	self centerViewAtAbs: newCenter