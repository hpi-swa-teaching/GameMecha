event handling
mouseMove: evt

	| globalCursor delta |
	self dragOffset ifNil: [^ self].
	globalCursor := evt hand position.
	delta := globalCursor - self dragOffset / self editor canvasMorph scaleFactor.
	self
		updatePosition: self position + delta;
		dragOffset: globalCursor.
	self editor ifNotNil: [self editor propertyPanel updateFrom: self].
	self placeHandles