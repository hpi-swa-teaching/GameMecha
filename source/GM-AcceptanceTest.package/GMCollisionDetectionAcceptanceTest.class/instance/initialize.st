initialization
initialize
	super initialize.
	self extent: self class worldExtent.
	self collisionMorphs do: [:aMorph | 
		self addMorph: aMorph. 
		"We add the Morphs to our GMCollisionHandler to be able to detect collisions between these Morphs.
		Attention in case of our RotatedRectangleMorph we add the TransformationMorph which is stored
		in the collisionMorphs collection. See collisionMorphRotatedrectangle for more details."
		self collisionHandler addCollisionMorph: aMorph].
	"For didactic reasons we handle our RectangleMorph a bit different to show another collision detection
	method (see step for more details). Notice that we do not register our RectangleMorph at our GMCollisionHandler"
	self addMorph: self collisionMorphRectangle.