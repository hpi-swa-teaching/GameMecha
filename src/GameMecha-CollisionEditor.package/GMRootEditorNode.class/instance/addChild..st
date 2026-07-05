inheritance
addChild: aGMEditorNode

	(self children size = 1 and: [self children first editorNodeType = #Composite])
		ifTrue: [self children first addChild: aGMEditorNode]
		ifFalse: [self children add: aGMEditorNode]