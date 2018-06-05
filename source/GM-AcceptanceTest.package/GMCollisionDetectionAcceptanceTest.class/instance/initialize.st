initialization
initialize
	super initialize.
	self extent: 700 @ 700.
	self collisionMorphs: ((OrderedCollection newFrom: 
		{self circleCollisionMorph.
		self rotatedRectangleCollisionMorph}) 
		do: [:aMorph | 
			self addMorph: aMorph. 
			self collisionHandler addMorph: aMorph];
		yourself).