collision
isCollidingWithCircle: aMorph
	^ self 
		circleAt: (self rotatePointAroundCenter: aMorph center)
		withRadius: aMorph gmCollisionDetectionShape radius
		isCollidingWithRectangleAt: self owner center
		withExtent: self rectangleExtent