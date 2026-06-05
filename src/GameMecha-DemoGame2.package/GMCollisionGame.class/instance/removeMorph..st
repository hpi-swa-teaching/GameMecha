game logic
removeMorph: aMorph
	
	self collisionManager removeMorph: aMorph.
	super removeMorph: aMorph.
	aMorph delete