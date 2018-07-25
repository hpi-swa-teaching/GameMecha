collision
canIntersectCircle: aMorph
	^ ((self centerDistanceFrom: aMorph center) x < 
			(self rectangleExtent x / 2 + aMorph gmCollisionDetectionShape radius) and:
		[(self centerDistanceFrom: aMorph center) y <
			(self rectangleExtent y / 2 + aMorph gmCollisionDetectionShape radius)])