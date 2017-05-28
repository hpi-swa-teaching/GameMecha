collision type testing
collidersIntersect
	collidersIntersect ifNil: [self collidersIntersect: (self collider1 intersects: self collider2)].
	^ collidersIntersect