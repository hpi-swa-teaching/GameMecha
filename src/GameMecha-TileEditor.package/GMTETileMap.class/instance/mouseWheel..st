event handling
mouseWheel: anEvent
	
	self hasStaticView ifTrue: [^ nil].
	anEvent isWheelDown ifTrue: [self zoomOutAt: (anEvent position - self topLeft)].
	anEvent isWheelUp ifTrue:  [self zoomInAt: (anEvent position - self topLeft)]