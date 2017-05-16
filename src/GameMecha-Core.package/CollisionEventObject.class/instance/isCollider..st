collider testing
isCollider: aPossibleCollider
	"returns true, if the passed argument is part of the collision"

	^ (self collider1 = aPossibleCollider)
		or: [self collider2 = aPossibleCollider].