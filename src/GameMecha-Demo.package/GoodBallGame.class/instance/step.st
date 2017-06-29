initializing
step 
	super step.
	(self keyboard isKeyDown: #keyEscape)
		ifTrue: [self delete].