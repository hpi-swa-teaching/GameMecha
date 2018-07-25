circle rectangle collision
circleAt: circlePos mustIntersectRectangleAt: rectanglePos withExtent: extent
	^ ((self absDistanceFrom: circlePos to: rectanglePos) x <= (extent x / 2) or:
		[(self absDistanceFrom: circlePos to: rectanglePos) y <= (extent y / 2)])