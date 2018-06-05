collision
addCollisionMorphs: aCollection
	self collisionMorphs addAll: aCollection.
	self collisionMorphs do: [:aMorph |
		self addMorph: aMorph.
		self collisionHandler addMorph: aMorph].