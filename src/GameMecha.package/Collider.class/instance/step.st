obstacle
step 
	(self previousBounds = self bounds) ifFalse:[
		self previousBounds: self bounds copy.].
	super step.