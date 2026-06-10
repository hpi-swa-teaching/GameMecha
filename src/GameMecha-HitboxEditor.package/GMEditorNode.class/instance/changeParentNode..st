inheritance
changeParentNode: aGMEditorNode

	self parent removeChildren: self.
	self parent: aGMEditorNode.
	aGMEditorNode addChildren: self