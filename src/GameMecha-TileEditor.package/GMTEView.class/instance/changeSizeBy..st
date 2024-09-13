updating
changeSizeBy: aFloat
	
	| newExtent newOrigin |
	newExtent := self correctedExtent: (self extent + (aFloat@aFloat)).
	newOrigin := self correctedOrigin: self origin withExtent: newExtent.
	
	self origin: newOrigin.
	self extent: newExtent