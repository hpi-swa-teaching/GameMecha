collision
isCollidingWithRectangle: aMorph
	^ self 
		areCorners: self corners
		intersectingWith: aMorph gmCollisionDetectionShape corners
		onSeparatingAxes: (self separatingAxes union: aMorph gmCollisionDetectionShape separatingAxes)