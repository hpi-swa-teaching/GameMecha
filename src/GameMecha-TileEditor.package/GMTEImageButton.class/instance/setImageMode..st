visual properties
setImageMode: aString
	
	self fullResolutionSprite: (self stateSprites at: aString).
	self extent: self extent