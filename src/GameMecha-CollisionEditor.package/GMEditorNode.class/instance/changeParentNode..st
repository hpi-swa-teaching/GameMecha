inheritance
changeParentNode: aGMEditorNode

	self parent removeChild: self.
	self parent: aGMEditorNode.
	aGMEditorNode addChild: self