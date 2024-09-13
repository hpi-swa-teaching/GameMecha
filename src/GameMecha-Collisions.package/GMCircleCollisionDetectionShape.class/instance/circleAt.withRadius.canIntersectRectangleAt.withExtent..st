utility
circleAt: circlePos withRadius: circleRadius canIntersectRectangleAt: rectanglePos withExtent: rectangleExtent
	^ (self absDistanceFrom: circlePos to: rectanglePos) x < (rectangleExtent x / 2 + circleRadius) and:
		[(self absDistanceFrom: circlePos to: rectanglePos) y < (rectangleExtent y / 2 + circleRadius)]