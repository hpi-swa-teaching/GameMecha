collider testing
collisionPartnerOf: aPossibleCollider
	"This method returns 'the other morph'. More precisely: It returns nil,
	if the argument is not part of the collision, and the morph it collides with, if it is."
	
	(self isCollider: aPossibleCollider)
		ifFalse: [^ nil].
	
	^ (self collider1 = aPossibleCollider)
		ifTrue: [self collider2]
		ifFalse: [self collider1].
	