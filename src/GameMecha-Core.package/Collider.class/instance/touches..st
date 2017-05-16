collision
touches: anObject
	^ self intersects: anObject withMargin: (self touchMargin max: anObject touchMargin).