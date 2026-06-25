accessing
setUp

	morphA := self newCollisionMorph.
	morphB := self newCollisionMorph.
	self collisionManager addMorphs: {morphA. morphB}