drawing
addImportedMorphToCanvas: aMorph withRotation: aNumber inRelationTo: aGMEditorNode

	| container |
	container := GMResizeContainer new
		setContent: aMorph;
		editor: self editor;
		editorNode: aGMEditorNode;
		yourself.
	self viewport addMorph: container.
	self activeMorph: container.
	container rotation: aNumber radiansToDegrees
	