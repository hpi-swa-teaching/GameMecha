utility
circleAt: circlePos withRadius: circleRadius isCollidingWithRectangleAt: rectanglePos withExtent: rectangleExtent
	(self circleAt: circlePos 
		withRadius: circleRadius 
		canIntersectRectangleAt: rectanglePos 
		withExtent: rectangleExtent)
		ifFalse: [^ false].
	(self circleAt: circlePos
		mustIntersectRectangleAt: rectanglePos 
		withExtent: rectangleExtent)
		ifTrue: [^ true].
	^ self circleAt: circlePos withRadius: circleRadius isIntersectingRectangleAt: rectanglePos withExtent: rectangleExtent