removing
removeCollisionMorph: aMorph
	self collisionMorphs remove: aMorph ifAbsent: [self error: 'CollisionHandler does not know this Morph.'].