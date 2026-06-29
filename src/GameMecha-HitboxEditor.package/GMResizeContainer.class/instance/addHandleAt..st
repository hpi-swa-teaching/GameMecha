handels
addHandleAt: aPositionSymbol

	| handle |
	handle := RectangleMorph new
		extent: self handleSize;
		color: self handleColor;
		borderWidth: 0;
		yourself.
	handle on: #mouseDown send: #handleDragStart: to: self.
	handle on: #mouseMove send: ('drag', aPositionSymbol capitalized, 'Event:') asSymbol to: self.
	handle on: #mouseUp send: #handleDragEnd: to: self.
	handle setProperty: #morphicLayerNumber toValue: self handleLayer.
	self addMorphInLayer: handle.
	resizeHandles at: aPositionSymbol put: handle
