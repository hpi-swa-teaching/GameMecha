collision
intersects: anObject
	^ (super intersects: anObject)
		and: [anObject intersectsCircle: self].