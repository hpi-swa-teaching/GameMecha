initializing
step 
	super step.
	water offset: water offset + 1 asPoint.
	(self keyboard isKeyDown: #keyEscape)
		ifTrue: [self delete].