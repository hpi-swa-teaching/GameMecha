initializing
step
	super step.
	(self keyboard isActionKeyDown: #up) ifTrue: [self moveUp].
	(self keyboard isActionKeyDown: #down) ifTrue: [self moveDown].
	(self keyboard isActionKeyDown: #left) ifTrue: [self moveLeft].
	(self keyboard isActionKeyDown: #right) ifTrue: [self moveRight].