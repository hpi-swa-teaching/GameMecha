accessing
setupObstacle: anObstacle
	anObstacle collisionBehavior: (RectangleCollisionBehavior newOn: anObstacle).
	anObstacle color: Color green.
	anObstacle markAsObstacle.
	anObstacle registerCollisionHandler: [:event| self color: [Color random adjustSaturation: 1 brightness: 1] value].
	^anObstacle.