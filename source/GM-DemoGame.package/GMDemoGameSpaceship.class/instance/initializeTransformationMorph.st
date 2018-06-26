initialization
initializeTransformationMorph
	"The spaceship should be able to rotate. Therefore, it has to be contained inside of a TransformationMorph"
	self addFlexShell.
	"the rotatedRectangleCollision is a special case: the TransformationMorph containing the colliding Morph has to receive the instance of the GMRotatedRectangleCollisionDetectionShape. Moreover, the TransformationMorph has to be registered at the collisionHandler, not the contained morph."
	self owner collisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new.
	"The spaceship is a submorph of the TransformationMorph which will be added as a submorph of the demoGame."
	self transformationMorph: self owner.