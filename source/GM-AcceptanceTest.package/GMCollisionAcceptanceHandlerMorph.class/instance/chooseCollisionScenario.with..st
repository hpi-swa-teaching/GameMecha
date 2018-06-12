collision
chooseCollisionScenario: collisionMorphType with: anotherCollisionMorphType
	self 
		removeAllMorphsIn: self collisionMorphs;
		collisionMorphs: OrderedCollection new.
	self collisionHandler removeAllMorphs;
		addCollisionMorphs: 
		{(self collisionTypeDictionary at: collisionMorphType) value.
		(self collisionTypeDictionary at: anotherCollisionMorphType) value}.
	self shuffleMorphs.