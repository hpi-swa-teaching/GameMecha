accessing
isObstacle
	isObstacle ifNil:[self isObstacle: false].
	^isObstacle.