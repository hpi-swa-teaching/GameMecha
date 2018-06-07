accessing
collisionMorphs
	^ collisionMorphs ifNil: [collisionMorphs := OrderedCollection new]