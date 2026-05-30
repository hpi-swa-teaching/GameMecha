collision
morphsCollidingWith: aMorph

	^ (self morphs reject: [:morph | morph == aMorph]) select: [:morph | self is: aMorph collidingWith: morph]