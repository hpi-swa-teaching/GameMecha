collision
mustIntersectCircle: aMorph
	^ ((self centerDistanceFrom: aMorph center) x <= (self rectangleExtent x / 2) or:
		[(self centerDistanceFrom: aMorph center) y <= (self rectangleExtent y / 2)]) 