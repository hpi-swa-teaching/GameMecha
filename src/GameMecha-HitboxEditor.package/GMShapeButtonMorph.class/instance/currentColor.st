accessing
currentColor

	isPressed ifTrue: [^ pressColor].
	isHovered ifTrue: [^ hoverColor].
	^ shapeColor