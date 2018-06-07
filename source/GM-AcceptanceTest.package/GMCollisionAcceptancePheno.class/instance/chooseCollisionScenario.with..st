collision
chooseCollisionScenario: collisionMorphType with: anotherCollisionMorphType
	self removeAllMorphsIn: self collisionMorphs.
	self collisionMorphs: OrderedCollection new.
	self collisionHandler removeAllMorphs.
	self addCollisionMorphs: {(self collisionTypeDictionary at: collisionMorphType) value.
		(self collisionTypeDictionary at: anotherCollisionMorphType) value}.
	self shuffleMorphs.