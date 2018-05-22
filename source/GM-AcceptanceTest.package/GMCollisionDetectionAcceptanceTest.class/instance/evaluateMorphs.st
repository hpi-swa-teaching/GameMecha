testing
evaluateMorphs
	self collisionMorphs do:
		[:aMorph | 
		((self collisionHandler morphsCollidingWith: aMorph) isEmpty)
			ifTrue: [aMorph color: Color green.
					aMorph submorphs do: [:aSubmorph | aSubmorph color: Color green]]
			ifFalse: [aMorph color: Color red.
					aMorph submorphs do: [:aSubmorph | aSubmorph color: Color red]]].