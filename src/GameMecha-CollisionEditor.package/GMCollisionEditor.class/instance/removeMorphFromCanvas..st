canvas
removeMorphFromCanvas: aMorph

	self removeEditorNode: aMorph editorNode.
	aMorph removeHitbox.
	self updateSidebarColliderList