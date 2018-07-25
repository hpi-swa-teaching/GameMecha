utility
circleAt: circlePos mustIntersectRectangleAt: rectanglePos withExtent: rectangleExtent
	^ ((self absDistanceFrom: circlePos to: rectanglePos) x <= (rectangleExtent x / 2) or:
		[(self absDistanceFrom: circlePos to: rectanglePos) y <= (rectangleExtent y / 2)])