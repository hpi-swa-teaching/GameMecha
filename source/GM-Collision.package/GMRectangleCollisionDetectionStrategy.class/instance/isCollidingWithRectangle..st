collision
isCollidingWithRectangle: aMorph
	^ self fullBounds intersects: aMorph collisionDetectionStrategy fullBounds