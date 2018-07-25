circle rectangle collision
circleAt: circlePos withRadius: radius isIntersectingRectangleAt: rectanglePos withExtent: extent
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ ((self absDistanceFrom: circlePos to: rectanglePos) squaredDistanceTo: extent / 2) <= 
		radius squared