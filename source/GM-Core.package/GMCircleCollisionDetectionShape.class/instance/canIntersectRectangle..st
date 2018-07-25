collision
canIntersectRectangle: aMorph
	^ (self centerDistanceFrom: aMorph center) x < (aMorph extent x / 2 + self radius) and:
		[(self centerDistanceFrom: aMorph center) y < (aMorph extent y / 2 + self radius)]