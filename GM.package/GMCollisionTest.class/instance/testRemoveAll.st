testing
testRemoveAll
	| aMorph |
	aMorph := Morph new.
	self collisionHandler addMorph: aMorph.
	self assert: [self collisionHandler includes: aMorph].
	self collisionHandler removeAllMorphs.
	self deny: [self collisionHandler includes: aMorph].