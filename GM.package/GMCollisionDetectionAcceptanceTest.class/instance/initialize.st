initialization
initialize
	super initialize.
	self extent: self class worldExtent.
	self collisionMorphs: ((OrderedCollection newFrom: 
		{self collisionMorphCircle.
		self collisionMorphRotatedRectangle}) 
		do: [:aMorph | 
			self addMorph: aMorph. 
			self collisionHandler addMorph: aMorph];
		yourself).