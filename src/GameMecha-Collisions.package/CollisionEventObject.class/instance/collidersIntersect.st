collision type testing
collidersIntersect
	collidersIntersect ifNil: [self collidersIntersect: (self collider1 intersectsWith: self collider2)].
	^ collidersIntersect.