test cases
testAssigningCollisionDetectionStrategy
    | aCollisionDetectionStrategy aMorph |
    aMorph := Morph new.
    aCollisionDetectionStrategy := GMRectangleCollisionDetectionShape new.
    self assert: [aMorph gmCollisionDetectionShape isNil].
    aMorph gmCollisionDetectionStrategy: aCollisionDetectionStrategy.
    self 
	assert: [aMorph gmCollisionDetectionShape == aCollisionDetectionStrategy];
   	assert: [aMorph gmCollisionDetectionShape owner == aMorph].