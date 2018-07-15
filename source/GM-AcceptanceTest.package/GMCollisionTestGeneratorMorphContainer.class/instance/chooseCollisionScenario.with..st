collision
chooseCollisionScenario: aCollisionMorphShape with: anotherCollisionMorphShape
	self removeAllMorphsIn: self collisionMorphs.
	self	collisionMorphs: OrderedCollection new.
	self collisionHandler removeAllMorphs.
	self	addCollisionMorphs: 
		{(self collisionShapeDictionary at: aCollisionMorphShape) value.
		(self collisionShapeDictionary at: anotherCollisionMorphShape) value}.
	self shuffleMorphs.