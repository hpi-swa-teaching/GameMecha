game logic
removeRotatedMorph: aMorph
	
	self collisionManager removeMorph: (aMorph submorphs at: 1).
	super removeMorph: aMorph.
	aMorph delete