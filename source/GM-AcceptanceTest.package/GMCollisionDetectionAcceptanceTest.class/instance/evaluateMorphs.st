testing
evaluateMorphs
	self collisionMorphs do:
		[:aMorph | 
		((self collisionHandler morphsCollidingWith: aMorph) isEmpty)
			ifTrue: [aMorph color: Color green]
			ifFalse: [aMorph color: Color red]].