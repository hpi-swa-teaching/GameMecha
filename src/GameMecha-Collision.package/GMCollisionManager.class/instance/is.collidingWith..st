backwards-compatibility
is: aMorph collidingWith: anotherMorph
	"
	[DEPRECATED] This API is provided for backwards compatibility and should not be used.
	Use collisionEventOf:with: instead, as it provides more flexibility and more information about the collision.
	Overall handling collisions should not be done in a request-response fashion, but rather in a update and get notified one.
	You can refer to `update` to dig deeper here.
	"

	^ (self shouldFallbackToOldBehavior: aMorph and: anotherMorph)
		ifFalse: [(self collisionEventOf: aMorph with: anotherMorph) hasCollided]
		ifTrue: [
			self
				backwardsCompatibleIs: aMorph
				collidingWith: anotherMorph]