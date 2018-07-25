collision
isCollidingWithRectangle: aMorph
	^ self
		circleAt: self owner center 
		withRadius: self radius 
		isCollidingWithRectangleAt: aMorph center
		withExtent: aMorph extent