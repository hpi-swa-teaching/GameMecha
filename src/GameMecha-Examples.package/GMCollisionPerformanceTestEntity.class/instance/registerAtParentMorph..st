collision
registerAtParentMorph: aMorph
	self parent: aMorph.
	self addFlexShell.
	self owner gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new.
	self parent addMorph: self owner.
	self parent collisionHandler addCollisionMorph: self owner.