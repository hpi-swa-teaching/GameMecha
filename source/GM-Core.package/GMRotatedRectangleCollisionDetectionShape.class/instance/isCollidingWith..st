collision
isCollidingWith: aMorph
	^ aMorph gmCollisionDetectionShape isCollidingWithRotatedRectangle: self owner