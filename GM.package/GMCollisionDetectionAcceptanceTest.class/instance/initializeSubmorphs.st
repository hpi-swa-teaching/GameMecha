initialization
initializeSubmorphs
	self collisionMorphs: (OrderedCollection newFrom: 
		{self circleCollisionMorph. 
		self rectangleCollisionMorph. 
		self rotatedRectangleCollisionMorph}).
	self collisionMorphs do:
		[:aMorph | self addMorph: aMorph. 
		self collisionHandler addMorph: aMorph]