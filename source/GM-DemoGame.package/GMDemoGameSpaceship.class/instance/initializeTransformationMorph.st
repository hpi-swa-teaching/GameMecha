initialization
initializeTransformationMorph
	self addFlexShell.
	self owner collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new.
	self transformationMorph: self owner.