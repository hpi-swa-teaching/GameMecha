collision
isIntersectingWithCircle: aMorph
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ ((self centerDistanceFrom: aMorph center) squaredDistanceTo: self rectangleExtent / 2) <= 
		aMorph gmCollisionDetectionShape radius squared