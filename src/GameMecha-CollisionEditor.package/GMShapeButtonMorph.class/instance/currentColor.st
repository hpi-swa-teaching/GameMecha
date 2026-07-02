color
currentColor

	self isHovered ifTrue: [^ self buttonColor adjustBrightness: -0.1].
	self isPressed ifTrue: [^ self buttonColor adjustBrightness: -0.1].
	^ self buttonColor