event handling
mouseUp: anEvent

	self enabled ifFalse: [^ nil].

	(self containsPoint: anEvent cursorPoint)
		ifTrue: [self doButtonAction]
		ifFalse: [self mouseLeave: anEvent].
	self buttonGroup ifNotNil: [self buttonGroup singleSelect: self].
	self updateVisualState: anEvent