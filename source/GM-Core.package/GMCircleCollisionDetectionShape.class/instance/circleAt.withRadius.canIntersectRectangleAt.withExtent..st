utility
circleAt: circlePos withRadius: radius canIntersectRectangleAt: rectanglePos withExtent: extent
	^ (self absDistanceFrom: circlePos to: rectanglePos) x < (extent x / 2 + radius) and:
		[(self absDistanceFrom: circlePos to: rectanglePos) y < (extent y / 2 + radius)]