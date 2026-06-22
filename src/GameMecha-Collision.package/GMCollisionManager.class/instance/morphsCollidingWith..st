backwards-compatibility
morphsCollidingWith: aMorph
	"
	[DEPRECATED] This API is provided for backwards compatibility and should not be used.
	Overall handling collisions should not be done in a request-response fashion, but rather in a update and get notified one.
	You can refer to `update` to dig deeper here.
	"

	^ (self morphs reject: [:morph | morph == aMorph]) select: [:morph | self is: aMorph collidingWith: morph]