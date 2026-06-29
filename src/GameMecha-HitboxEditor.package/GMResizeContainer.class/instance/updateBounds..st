event handling
updateBounds: aRectangle

	super extent: aRectangle extent.
	self updateCenter: aRectangle center.
	self resizeContentTo: self bounds.
	self editor ifNotNil: [self editor propertyPanel updateFrom: self].
	self placeHandles