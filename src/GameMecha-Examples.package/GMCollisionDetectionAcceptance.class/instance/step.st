stepping and presenter
step
	"We use our collisionHandler to get a list of all Morphs registered at this collisionHandler
	currently colliding with the specified Morph"
	self collisionMorphs do:
		[:aMorph | (self collisionHandler morphsCollidingWith: aMorph)
			ifEmpty: [aMorph renderedMorph color: Color green]
			ifNotEmpty: [aMorph renderedMorph color: Color red]].
	"Another possibility is to directly check for collision between two concrete Morphs. This does not
	require any of both Morphs to be registered at the GMCollisionHandler."
	(self collisionHandler is: self collisionMorphRectangle collidingWith: self collisionMorphCircle)
		 ifTrue: [self collisionMorphRectangle color: Color random].
	self moveCollisionMorphCircle.