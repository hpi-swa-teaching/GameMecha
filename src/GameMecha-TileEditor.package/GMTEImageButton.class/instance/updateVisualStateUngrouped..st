visual properties
updateVisualStateUngrouped: anEvent

	(self containsPoint: Sensor cursorPoint)
		ifTrue: [anEvent redButtonPressed
			ifTrue: [self setImageMode: 'pressed']
			ifFalse:[self setImageMode: 'hovered']]
		ifFalse: [self setImageMode: 'unpressed']
		