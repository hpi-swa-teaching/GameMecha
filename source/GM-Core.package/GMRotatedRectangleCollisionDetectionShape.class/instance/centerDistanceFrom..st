collision
centerDistanceFrom: aPoint
	^ ((self rotatePointAroundCenter: aPoint) - self owner center) abs