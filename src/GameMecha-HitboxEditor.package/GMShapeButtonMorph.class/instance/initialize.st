as yet unclassified
initialize

	super initialize.
	isHovered := false.
	isPressed := false.
	shapeColor := Color r: 0.7 g: 0.7 b: 0.7.
	hoverColor := Color r: 0.9 g: 0.9 b: 0.9.
	pressColor := Color r: 0.4 g: 0.4 b: 0.4.
	self extent: 40 @ 40.
	self color: Color transparent.
	self borderWidth: 0