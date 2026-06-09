assertions
assertCollider: aMorph

	(aMorph respondsTo: #collider) ifFalse: [self error: aMorph class name, ' does not implement #collider'].
	aMorph collider ifNil: [self error: aMorph class name, ' has a nil collider']