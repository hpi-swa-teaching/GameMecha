inheritance
removeChild: aGMEditorNode

	(self children size = 1 and: [self children first editorNodeType = #Composite])
		ifTrue: [self children first removeChild: aGMEditorNode]
		ifFalse: [self children remove: aGMEditorNode]