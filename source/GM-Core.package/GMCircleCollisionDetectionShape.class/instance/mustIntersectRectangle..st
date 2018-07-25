collision
mustIntersectRectangle: aMorph
	^ (self centerDistanceFrom: aMorph center) x <= (aMorph extent x / 2) or:
		[(self centerDistanceFrom: aMorph center) y <= (aMorph extent y / 2)] 