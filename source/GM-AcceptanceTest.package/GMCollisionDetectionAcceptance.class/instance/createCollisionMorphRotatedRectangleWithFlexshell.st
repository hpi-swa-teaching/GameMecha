creation
createCollisionMorphRotatedRectangleWithFlexshell
	 | aMorph |
	aMorph := RectangleMorph new
		extent: self class collisionMorphExtent;
		yourself.
	self addMorph: aMorph.
	"You need to add a FlexShell to be able to rotate a Morph"
	aMorph addFlexShell.
	
	"ATTENTION: you have to add the TransformationMorph (FlexShell) to the GMCollisionHandler.
	Therefore we return the owner of the Morph which is this TransformationMorph (becaused wie sent addFlexShell before.
	See initialize for more detaisl."
	^ aMorph owner 
		"To give a Morph the ability to collide it needs a GMCollisionDetectionShape. You can choose between
		GMCircleCollisionDetectionShape, GMRectangleCollisionDetectionShape or GMRotatedRectangleCollisionDetectionShape."
		gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
		angle: 30;
		yourself