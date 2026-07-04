accessing
extent: aPoint

	super extent: aPoint.
	
	self viewport ifNotNil: [
		self viewport bounds: self bounds.
		
		self viewport offset: (aPoint / 2.0) negated]