inheritance
changeParentNode: aGMEditorNode

	aGMEditorNode = self parent ifFalse: [
		self parent removeChild: self.
		self parent: aGMEditorNode.
		aGMEditorNode addChild: self]