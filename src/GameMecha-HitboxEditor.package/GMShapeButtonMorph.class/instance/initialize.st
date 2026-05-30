initialization
initialize

	super initialize.
	isHovered := false.
	isPressed := false.
	self
		shapeColor: self defaultShapeColor;
		hoverColor: self defaultHoverColor;
		pressColor: self defaultPressColor;
		extent: 40 px @ 40 px;
		color: Color transparent;
		borderWidth: 0