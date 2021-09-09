accessing
collisionShapeDictionary
	^ collisionShapeDictionary ifNil: [collisionShapeDictionary := Dictionary newFrom: {
		#circleCollisionMorph -> [self circleCollisionMorph].
		#rectangleCollisionMorph -> [self rectangleCollisionMorph].
		#rotatedRectangleCollisionMorph -> [self rotatedRectangleCollisionMorph]}] 