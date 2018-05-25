collision
isCollidingWithRectangle: aMorph
	^ self owner fullBounds intersects: aMorph fullBounds