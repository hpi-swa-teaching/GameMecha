initialization
initialize
	super initialize.
	self extent: self class worldExtent.
	self collisionMorphs do: [:aMorph | 
		self addMorph: aMorph. 
		self collisionHandler addCollisionMorph: aMorph].