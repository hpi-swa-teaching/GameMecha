collision
isCollidingWithRectangle: aMorph
	^ self 
		intersectingCorners: self corners
		with: aMorph gmCollisionDetectionShape corners
		onSeparatingAxes: (self separatingAxes union: aMorph gmCollisionDetectionShape separatingAxes)