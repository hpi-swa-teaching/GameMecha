testing
testAssigningCollisionDetectionStrategy
	| aCollisionDetectionStrategy aMorph |
	aMorph := Morph new.
	aCollisionDetectionStrategy := GMRectangleCollisionDetectionStrategy new.
	self assert: [aMorph collisionDetectionStrategy isNil].
	aMorph collisionDetectionStrategy: aCollisionDetectionStrategy.
	self assert: [aMorph collisionDetectionStrategy == aCollisionDetectionStrategy].
	self assert: [aMorph collisionDetectionStrategy owner == aMorph].