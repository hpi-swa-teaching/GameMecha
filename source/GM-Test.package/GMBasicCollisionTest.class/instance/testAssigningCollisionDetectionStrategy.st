testing
testAssigningCollisionDetectionStrategy
    | aCollisionDetectionStrategy aMorph |
    aMorph := Morph new.
    aCollisionDetectionStrategy := GMRectangleCollisionDetectionShape new.
    self assert: [aMorph collisionDetectionStrategy isNil].
    aMorph collisionDetectionStrategy: aCollisionDetectionStrategy.
    self 
	assert: [aMorph collisionDetectionStrategy == aCollisionDetectionStrategy];
   	assert: [aMorph collisionDetectionStrategy owner == aMorph].