initialization
initializeTransformationMorph
	Morph new addMorph: self.
	self addFlexShell.
	self owner collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionStrategy new.
	self transformationMorph: self owner.