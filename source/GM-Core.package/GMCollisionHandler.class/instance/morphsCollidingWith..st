collision detection
morphsCollidingWith: aMorph
	^ (self collisionMorphs 
		reject: [:morph | morph == aMorph])
		select: [:morph | (morph bounds intersects: aMorph bounds) and: 
			[aMorph collisionDetectionStrategy isCollidingWith: morph]]