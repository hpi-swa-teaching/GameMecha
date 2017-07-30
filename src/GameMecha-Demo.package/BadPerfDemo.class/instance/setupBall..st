as yet unclassified
setupBall: aBall
	^aBall collisionBehavior: (CircleCollisionBehavior newOn: aBall).