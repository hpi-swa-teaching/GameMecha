collision
intersects: anObject withMargin: tolerance
	^ (super intersects: anObject withMargin: tolerance)
		and: [anObject intersectsCircle: self withMargin: tolerance].