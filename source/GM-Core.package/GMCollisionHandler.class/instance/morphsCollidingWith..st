collision detection
morphsCollidingWith: aMorph
	^ (self collisionMorphs 
		reject: [:morph | morph == aMorph])
		select: [:morph | self is: aMorph collidingWith: morph]