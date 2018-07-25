utility
circleAt: circlePos withRadius: circleRadius isIntersectingRectangleAt: rectanglePos withExtent: rectangleExtent
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ ((self absDistanceFrom: circlePos to: rectanglePos) squaredDistanceTo: rectangleExtent / 2) <= 
		circleRadius squared