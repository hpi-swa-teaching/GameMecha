visual properties
updateVisualStateGrouped: anEvent

	self selected
		ifFalse: [
			(self containsPoint: Sensor cursorPoint)
				ifTrue: [anEvent redButtonPressed
					ifTrue: [self setImageMode: 'pressed']
					ifFalse:[self setImageMode: 'hovered']]
				ifFalse: [self setImageMode: 'unpressed']]