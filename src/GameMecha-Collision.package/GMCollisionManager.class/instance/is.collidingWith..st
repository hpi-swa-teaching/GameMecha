collision
is: aMorph collidingWith: anotherMorph
	"
	This API is provided for backwards compatibility and should not be used.
	Use collisionEventOf:with: instead, as it provides more flexibility and more information about the collision.
	"

	^ (self collisionEventOf: aMorph with: anotherMorph) hasCollided