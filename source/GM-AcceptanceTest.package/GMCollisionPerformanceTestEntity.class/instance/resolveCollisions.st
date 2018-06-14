as yet unclassified
resolveCollisions
	| collidingMorphs |
	collidingMorphs := self parentMorph collisionHandler morphsCollidingWith: self owner.
	collidingMorphs notEmpty ifTrue: [self velocity: self velocity negated. self move].
	collidingMorphs do: [:otherMorph | otherMorph renderedMorph velocity: otherMorph renderedMorph velocity negated.
		 otherMorph renderedMorph move].