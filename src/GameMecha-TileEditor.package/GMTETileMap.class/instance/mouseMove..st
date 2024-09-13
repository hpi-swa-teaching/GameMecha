event handling
mouseMove: anEvent

	self hasStaticView ifTrue: [^ nil].
	anEvent shiftPressed ifFalse: [^ nil].
	anEvent redButtonPressed ifFalse: [^ nil].
	
	self moveViewBy: (anEvent startPoint - anEvent position)