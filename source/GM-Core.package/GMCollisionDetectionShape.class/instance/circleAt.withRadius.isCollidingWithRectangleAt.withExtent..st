circle rectangle collision
circleAt: circlePos withRadius: radius isCollidingWithRectangleAt: rectanglePos withExtent: extent
	(self circleAt: circlePos 
		withRadius: radius 
		canIntersectRectangleAt: rectanglePos 
		withExtent: extent)
		ifFalse: [^ false].
	(self circleAt: circlePos
		mustIntersectRectangleAt: rectanglePos 
		withExtent: extent)
		ifTrue: [^ true].
	^ self circleAt: circlePos withRadius: radius isIntersectingRectangleAt: rectanglePos withExtent: extent