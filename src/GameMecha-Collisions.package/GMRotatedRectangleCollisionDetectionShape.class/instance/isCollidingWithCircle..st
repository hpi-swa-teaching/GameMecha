collision
isCollidingWithCircle: aMorph
	^ aMorph gmCollisionDetectionShape 
		circleAt: (self rotatePointAroundCenter: aMorph center)
		withRadius: aMorph gmCollisionDetectionShape radius
		isCollidingWithRectangleAt: self owner center
		withExtent: self rectangleExtent