accessing
collisionMorphs
	^ collisionMorphs ifNil: [collisionMorphs := (OrderedCollection newFrom: 
		{self collisionMorphCircle.
		self collisionMorphRotatedRectangleWithFlexShell})]