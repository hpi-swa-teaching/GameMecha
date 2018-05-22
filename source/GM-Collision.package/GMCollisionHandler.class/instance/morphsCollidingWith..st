collision detection
morphsCollidingWith: aMorph
	^ (self collisionMorphs 
		reject: [:morph | morph == aMorph])
		select: [:morph | (morph fullBounds intersects: aMorph fullBounds) and: [aMorph collisionDetectionStrategy isCollidingWith: morph]]