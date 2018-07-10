as yet unclassified
registerAtParentMorph: aParentMorph
	self parentMorph: aParentMorph.
	self addFlexShell.
	self owner gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new.
	self parentMorph addMorph: self owner.
	self parentMorph collisionHandler addCollisionMorph: self owner.