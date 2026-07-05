drawing
addImportedMorphToCanvas: aMorph withRotation: aNumber

	| container |
	container := GMResizeContainer new
		setContent: aMorph;
		editor: self editor;
		yourself.
	self viewport addMorph: container.
	self activeMorph: container.
	container rotation: aNumber radiansToDegrees
	