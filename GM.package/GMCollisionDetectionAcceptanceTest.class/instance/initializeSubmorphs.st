initialization
initializeSubmorphs
	3 timesRepeat: 
		[self collisionMorphs 
			add: self createCircleCollisionMorph;
			add: self createRectangleCollisionMorph;
			add: self createRotatedRectangleCollisionMorph].
	self collisionMorphs do:
		[:aMorph | self addMorph: aMorph. 
		self collisionHandler addMorph: aMorph]