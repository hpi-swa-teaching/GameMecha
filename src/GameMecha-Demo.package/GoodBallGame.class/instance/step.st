initializing
step 
	super step.
	water offset: water offset + 1 asPoint.
	(self keyboard isActionKeyDown: #exit)
		ifTrue: [self delete].