test cases
testAssigningCollider

	| aCollider aMorph |
	aMorph := GMCollisionTestMorph new.
	aCollider := GMCollider new.
	self assert: [aMorph collider isNil].
	aMorph collider: aCollider.
	self 
		assert: [aMorph collider == aCollider];
		assert: [aMorph collider parent == aMorph]