as yet unclassified
initialize

	super initialize.
	isHovered := false.
	isPressed := false.
	self shapeColor: self defaultShapeColor.
	self hoverColor: self defaultHoverColor.
	self pressColor: self defaultPressColor.
	self extent: 40 @ 40.
	self color: Color transparent.
	self borderWidth: 0