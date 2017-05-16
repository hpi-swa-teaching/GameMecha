collision
intersects: anObject withMargin: tolerance
	^ (super intersects: anObject withMargin: tolerance)
		and: [anObject intersectsRect: self withMargin: tolerance].