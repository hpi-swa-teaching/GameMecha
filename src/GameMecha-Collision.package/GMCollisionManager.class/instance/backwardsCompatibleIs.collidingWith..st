backwards-compatibility
backwardsCompatibleIs: aMorph collidingWith: anotherMorph
	"
	[DEPRECATED] This API is provided for backwards compatibility and should not be used.
	"

	^ (aMorph bounds intersects: anotherMorph bounds) and: [aMorph gmCollisionDetectionShape isCollidingWith: anotherMorph]