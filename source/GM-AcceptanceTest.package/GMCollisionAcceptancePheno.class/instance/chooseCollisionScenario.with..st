collision
chooseCollisionScenario: aCollisionMorph with: anotherCollisionMorph
	
	self removeAllMorphsIn: self collisionMorphs.
	self collisionMorphs: (OrderedCollection newFrom: {self perform: aCollisionMorph. self perform: anotherCollisionMorph}).
	self collisionMorphs do: [:aMorph | 
		self addMorph: aMorph.
		self collisionHandler addMorph: aMorph].
	self shuffleMorphs.