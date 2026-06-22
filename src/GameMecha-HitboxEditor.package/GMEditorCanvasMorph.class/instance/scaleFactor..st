accessing
scaleFactor: aNumber

	scaleFactor := aNumber.
	
	self viewport ifNotNil: [
		self viewport scale: aNumber.
		self viewport offset: (self extent / 2.0) negated].
	
	self changed