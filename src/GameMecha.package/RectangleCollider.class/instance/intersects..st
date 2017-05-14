collision
intersects: anObject
	^ (super intersects: anObject)
		and: [anObject intersectsRect: self].