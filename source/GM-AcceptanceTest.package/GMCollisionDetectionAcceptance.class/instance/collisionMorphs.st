accessing
collisionMorphs
	^ collisionMorphs ifNil: [collisionMorphs := (OrderedCollection newFrom: 
		{self createCollisionMorphCircle.
		self createCoollisionMorphFlexShellOfRotatedRectangle})]