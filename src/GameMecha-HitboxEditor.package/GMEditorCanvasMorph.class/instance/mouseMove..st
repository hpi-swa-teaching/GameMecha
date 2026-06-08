mousebehaviour
mouseMove: anEvent

	| newPos |
	activeMorph ifNil: [^ self].
	
	newPos := anEvent position - dragOffset.
	
	newPos := newPos max: self bounds topLeft.
	newPos := newPos min: self bounds bottomRight - activeMorph extent.
	
	activeMorph position: newPos