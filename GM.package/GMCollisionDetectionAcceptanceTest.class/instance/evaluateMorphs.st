testing
evaluateMorphs
	self collisionMorphs do:
		[:aMorph | 
		(self collisionHandler morphsCollidingWith: aMorph)
			ifEmpty: [aMorph color: Color green.
				aMorph submorphs do: [:aSubmorph | aSubmorph color: Color green]]
			ifNotEmpty: [aMorph color: Color red.
				aMorph submorphs do: [:aSubmorph | aSubmorph color: Color red]]].