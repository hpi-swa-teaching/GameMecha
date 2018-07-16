stepping and presenter
step
	"We use our collisionHandler to get a list of all Morphs registered at this collisionHandler
	currently colliding with the specified Morph"
	self collisionMorphs do:
		[:aMorph | (self collisionHandler morphsCollidingWith: aMorph)
			ifEmpty: [aMorph renderedMorph color: Color green]
			ifNotEmpty: [aMorph renderedMorph color: Color red]].
	"Another possibility is to directly check for collision between two concrete Morphs. This is event 
	possible when neither of the Morphs was register at the GMCollisionHandler before."
	(self collisionHandler is: self collisionMorphRectangle collidingWith: self createCollisionMorphCircle)
		 ifTrue: [self collisionMorphRectangle color: Color random].
	self moveCollisionMorph.