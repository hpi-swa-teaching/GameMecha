accessing
collisionPartnerOf: aPossibleCollider
	
	(self isCollider: aPossibleCollider)
		ifFalse: [^ nil].
	
	^ (self collider1 = aPossibleCollider)
		ifTrue: [self collider2]
		ifFalse: [self collider1].
	