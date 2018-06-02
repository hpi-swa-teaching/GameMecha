collision
chooseCollisionScenario: collisionMorphType with: anotherCollisionMorphType
	self removeAllMorphsIn: self collisionMorphs.
	self collisionHandler removeAllMorphs.
	self collisionMorphs: (OrderedCollection newFrom: 
		{(self collisionTypeDictionary at: collisionMorphType) value.
		(self collisionTypeDictionary at: anotherCollisionMorphType) value}).
	self collisionMorphs do: [:aMorph |
		self addMorph: aMorph.
		self collisionHandler addMorph: aMorph].
	self shuffleMorphs.