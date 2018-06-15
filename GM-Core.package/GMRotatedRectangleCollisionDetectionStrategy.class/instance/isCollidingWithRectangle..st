collision
isCollidingWithRectangle: aMorph
	^ self 
		intersectingCorners: self corners
		with: aMorph collisionDetectionStrategy corners
		onSeparatingAxes: (self separatingAxes union: aMorph collisionDetectionStrategy separatingAxes)