testing
evaluateMorphs
	self collisionMorphs do:
		[:aMorph | (self collisionHandler morphsCollidingWith: aMorph)
			ifEmpty: [aMorph renderedMorph color: Color green]
			ifNotEmpty: [aMorph renderedMorph color: Color red]].