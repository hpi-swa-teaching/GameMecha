accessing
corners
	^ self originalCorners collect: [:originalCorner |
		(originalCorner * self owner scale 
			rotateBy: self owner angle about: self originalRectangle center) 
			+ self owner center]