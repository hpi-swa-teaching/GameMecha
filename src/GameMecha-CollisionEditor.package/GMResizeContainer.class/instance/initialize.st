initialization
initialize

	super initialize.
	self resizeHandles: Dictionary new.
	self dragOffset: nil.
	self isRotated: false.
	self
		color: Color transparent;
		borderWidth: self borderWidth;
		borderColor: self borderColor
