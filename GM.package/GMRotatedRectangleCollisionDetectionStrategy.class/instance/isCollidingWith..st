collision
isCollidingWith: aMorph
	^ aMorph collisionDetectionStrategy isCollidingWithRotatedRectangle: self owner