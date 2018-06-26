as yet unclassified
registerAtParentMorph: aParentMorph
	self parentMorph: aParentMorph.
	self addFlexShell.
	self owner collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new.
	self parentMorph addMorph: self owner.
	self parentMorph collisionHandler addCollisionMorph: self owner.