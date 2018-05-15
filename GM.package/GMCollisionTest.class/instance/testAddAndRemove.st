testing
testAddAndRemove
	| aMorph |
	aMorph := Morph new.
	self deny: [self collisionHandler includes: aMorph].
	self collisionHandler addMorph: aMorph.
	self assert: [self collisionHandler includes: aMorph].
	self collisionHandler removeMorph: aMorph.
	self deny: [self collisionHandler includes: aMorph].
	