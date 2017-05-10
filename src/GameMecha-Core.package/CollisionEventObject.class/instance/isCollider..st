accessing
isCollider: aPossibleCollider
	^ (self collider1 = aPossibleCollider)
		or: [self collider2 = aPossibleCollider].