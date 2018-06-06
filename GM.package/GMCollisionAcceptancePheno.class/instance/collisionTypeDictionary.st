accessing
collisionTypeDictionary
	^ collisionTypeDictionary ifNil: [collisionTypeDictionary := Dictionary newFrom: {
		#circleCollisionMorph -> [self circleCollisionMorph].
		#rectangleCollisionMorph -> [self rectangleCollisionMorph].
		#rotatedRectangleCollisionMorph -> [self rotatedRectangleCollisionMorph]}] 