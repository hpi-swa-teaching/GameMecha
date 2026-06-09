collision
morphsCollidingWith: aMorph
	"
	This API is provided for backwards compatibility and should not be used.
	"

	^ (self morphs reject: [:morph | morph == aMorph]) select: [:morph | self is: aMorph collidingWith: morph]