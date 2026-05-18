as yet unclassified
currentColor

	isPressed ifTrue: [^ pressColor].
	isHovered ifTrue: [^ hoverColor].
	^ shapeColor